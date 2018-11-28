package com.upem.rentacar.controller.vitrine;

import com.upem.rentacar.model.gestion_vehicules.Car;
import com.upem.rentacar.model.gestion_vehicules.Rent;
import com.upem.rentacar.service.cars_management.CarsService;
import com.upem.rentacar.service.cars_management.RentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CarsController {

    @Autowired
    private CarsService carsService;
    @Autowired
    private RentService rentService;

    @RequestMapping(value = {"management_cars"}, method = RequestMethod.GET)
    public String getCarsCatalog(Model model){
        List<Car> cars = carsService.getAllCars();
        if(cars == null)
            cars = new ArrayList<Car>();
        model.addAttribute("listCars",cars);
        return "cars_management";
    }

    @RequestMapping(value = {"management_vehicules_list_employee"}, method = RequestMethod.GET)
    public String getCarsEmployeeList(Model model){
        List<Car> cars = carsService.getAllCarsNotSold();
        if(cars == null)
            cars = new ArrayList<Car>();
        model.addAttribute("listCars",cars);
        return "cars_list_client_view";
    }

    @RequestMapping(value = {"management_vehicules_list_client"}, method = RequestMethod.GET)
    public String getCarsClientsList(Model model){
        List<Car> cars = carsService.getAllCarsForSaleNotSold();
        if(cars == null)
            cars = new ArrayList<Car>();
        model.addAttribute("listCars",cars);
        return "cars_list_client_view";
    }

    @RequestMapping(value = {"management_get_all_cars_list.json"} , method = RequestMethod.GET)
    public List<Car> getAllCars(Model model){
            List<Car> cars = carsService.getAllCars();
            if(cars == null )
                cars = new ArrayList<Car>();
            return cars;
    }
    @RequestMapping(value = {"management_get_cars_list"} , method = RequestMethod.GET)
    public String getCarsListPage(Model model){
        List<Car> cars = carsService.getAllCars();
        if(cars == null)
            cars = new ArrayList<Car>();
        model.addAttribute("listCars",cars);
        return "cars_management";
    }

    @RequestMapping(value = {"management_remove_car"}, method = RequestMethod.POST)
    @ResponseBody  public String deleteCar(@RequestParam("id_car") Long id_car){
        if(carsService.deleteCarById(id_car) != null)
            return "100";
        else return "101";
    }

    @RequestMapping(value = {"management_get_car"}, method = RequestMethod.GET)
    public String getCar (@RequestParam("id_car") Long id_car, Model model ){
            Car car = carsService.getCarById(id_car);
            if(car == null)
                return "404";
            model.addAttribute("car" , car);
            return "cars_pages/car_overview";
    }

    @RequestMapping(value = {"management_get_car_web"}, method = RequestMethod.GET)
    public String getCarWeb (@RequestParam("car_id") Long car_id, Model model ){
        Car car = carsService.getCarById(car_id);
        if(car == null)
            return "404";
        model.addAttribute("car" , car);
        
        return "cars_pages/car_profile";
    }




    @RequestMapping(value = {"management_car_create"} , method = RequestMethod.POST)
    @ResponseBody public String postCreateCar(@RequestParam("model") String model,@RequestParam("brand") String brand,
                                              @RequestParam("circulation_year") Integer circulation_year,
                                              @RequestParam("description") String description,
                                              @RequestParam("cylinders_number") Integer cylinders_number,
                                              @RequestParam("maxspeed") Integer maxspeed
                                              ){
        Car car = new Car();
        car.setModel(model);
        car.setBrand(brand);
        car.setCirculation_year(circulation_year);
        car.setDescription(description);
        car.setCylinders_number(cylinders_number);
        car.setMax_speed(maxspeed);
        if( carsService.createCar(car)  != null )
            return "100";
        else return "101";

    }
    @RequestMapping(value = {"management_car_edit"}, method = RequestMethod.POST)
    @ResponseBody public String postEditCar(@RequestParam("id_user") Long id_car, @RequestParam("model") String model){
        Car car = carsService.getCarById(id_car);
        if(car != null)
            car.setModel(model);
        if( carsService.createCar(car) != null )
            return "100";
        else return "101";
    }

    @RequestMapping(value = {"management_get_all_car_rents.json"} , method = RequestMethod.GET)
    @ResponseBody public List<Rent> getAllCarRents(Model model,@RequestParam("car_id") Long car_id){
        List<Rent> rents = rentService.getRentsByCarIdNotFinishedOrderByDate(car_id);
        if(rents != null)
            return rents;
        else return new ArrayList<Rent>();

    }

    @RequestMapping(value = {"management_get_all_car_rents_user.json"} , method = RequestMethod.GET)
    @ResponseBody public List<Rent> getAllCarRentsUser(Model model,@RequestParam("car_id") Long car_id,@RequestParam("user_id") Long user_id){
        List<Rent> rents = rentService.getRentsByCarIdUserIdNotFinishedOrderByDate(car_id,user_id);
        if(rents != null)
            return rents;
        else return new ArrayList<Rent>();

    }






}
