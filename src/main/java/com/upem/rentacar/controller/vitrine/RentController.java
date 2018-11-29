package com.upem.rentacar.controller.vitrine;


import com.upem.rentacar.model.gestion_vehicules.Rent;
import com.upem.rentacar.service.cars_management.CarServiceImpl;
import com.upem.rentacar.service.cars_management.CarsService;
import com.upem.rentacar.service.cars_management.RentService;
import com.upem.rentacar.service.users_management.GestionUtilisateursService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Date;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
public class RentController {

    @Autowired
    private RentService rentService;
    @Autowired
    private CarsService carsService;
    @Autowired
    private GestionUtilisateursService utilisateursService;


    @RequestMapping(value = {"management_create_rent"}, method = RequestMethod.POST)
    @ResponseBody  public String createRent(Model model, @RequestParam("date_from") Long date_from,
                                          @RequestParam("date_to") Long date_to, @RequestParam("days") Integer days,
                                          @RequestParam("ordre") Integer ordre, @RequestParam("price") Double price,
                                          @RequestParam("user_id") String user_id, @RequestParam("car_id") Long car_id){
        try{
        Rent rent = new Rent();
        rent.setDate_from( new Date(date_from));
        rent.setDate_to( new Date(date_to));
        rent.setDays(days);
        rent.setOrdre(ordre);
        rent.setRent_price(price);
        rent.setFinished(false);
        rent.setUser_id(utilisateursService.getUtilisateurByIdUtilisateur(user_id).get(0));
        rent.setCar_id(carsService.getCarById(car_id));
        if(rentService.createRent(rent) !=null){
            List<Rent> rentList = rentService.getRentsByCarIdNotFinishedOrderByDate(car_id);
            if(rentList!=null){
                for(int i=0;i<rentList.size();i++)
                    rentList.get(i).setOrdre(i+1);
                rentService.createRents(rentList);
            }
            return  "100";

        }
        else return "101";
        }catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }


    }


    @RequestMapping(value = {"management_cloture_rent"}, method = RequestMethod.POST)
    @ResponseBody  public String cloture_rent(Model model, @RequestParam("id_rent") Long id_rent,@RequestParam("id_car") Long id_car){
        try {

            Rent rent = rentService.getRentById(id_rent);
            rent.setFinished(true);
            if (rentService.createRent(rent) != null) {
                List<Rent> rentList = rentService.getRentsByCarIdNotFinishedOrderByDate(id_car);
                if (rentList != null) {
                    for (int i = 0; i < rentList.size(); i++)
                        rentList.get(i).setOrdre(i + 1);
                    rentService.createRents(rentList);

                }
                return "100";
            }else return "101";

        }catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }



    }

/*
    @RequestMapping(value = {"management_get_all_reservations_by_user_id.json"} , method = RequestMethod.GET)
    public List<Rent> getAllCars(Model model, @RequestParam("user_id") Long user_id){
            List<Rent> rents = rentService.getRentsByUserIdNotFinishedOrderByDate(user_id);
            if(rents == null)
                rents = new ArrayList<Rent>();
            return rents;
    }
*/

}

