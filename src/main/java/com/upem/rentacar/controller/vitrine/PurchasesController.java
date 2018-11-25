package com.upem.rentacar.controller.vitrine;

import com.upem.rentacar.model.gestion_vehicules.Purchase;
import com.upem.rentacar.service.cars_management.CarsService;
import com.upem.rentacar.service.cars_management.PurchaseService;
import com.upem.rentacar.service.users_management.GestionUtilisateursService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Date;

@Controller
public class PurchasesController {
    @Autowired
    private PurchaseService purchaseService;
    @Autowired
    private CarsService carsService;
    @Autowired
    private GestionUtilisateursService utilisateursService;


    @RequestMapping(value = {"management_purchase_create"} , method = RequestMethod.POST)
    @ResponseBody
    public String postCreatePurchase(@RequestParam("user_id") String user_id,
                                     @RequestParam("car_id") Long car_id,
                                     @RequestParam("purchase_price") Double purchase_price,
                                     @RequestParam("purchase_date") Long purchase_date
                                     )
    {

        try {
            Purchase purchase = new Purchase();
            purchase.setCar_id(carsService.getCarById(car_id));
            purchase.setUser_id(utilisateursService.getUtilisateurByIdUtilisateur(user_id).get(0));
            purchase.setPurchase_price(purchase_price);
            purchase.setPurchase_date(new Date(purchase_date));
            if(purchaseService.createPurchase(purchase) !=null)
                return "100";
            else return  "101";


        }
        catch (Exception e){
            e.printStackTrace();
            return e.getMessage();
        }


    }


}
