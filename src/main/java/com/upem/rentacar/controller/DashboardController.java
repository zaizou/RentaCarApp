package com.upem.rentacar.controller;


import com.upem.rentacar.model.gestion_vehicules.Car;
import com.upem.rentacar.service.cars_management.CarsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
public class DashboardController {

    @Autowired
    private CarsService carsService;

    @RequestMapping(value = {"management_gestion_dashboard.html"}, method = RequestMethod.GET)
    public String getUserDashboard(Model model){
        List<Car> carList = carsService.getAllCars();
        if(carList == null )
            carList = new ArrayList<Car>();
        model.addAttribute("carsList",carList);
        return "dashboard";
    }
}
