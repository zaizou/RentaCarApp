package com.upem.rentacar.controller;


import com.upem.rentacar.model.gestion_vehicules.Car;
import com.upem.rentacar.model.gestion_vehicules.Rent;
import com.upem.rentacar.service.cars_management.CarsService;
import com.upem.rentacar.service.cars_management.RentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
    @Autowired
    private RentService rentService;

    @RequestMapping(value = {"management_gestion_dashboard.html"}, method = RequestMethod.GET)
    public String getUserDashboard(Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getPrincipal().toString();
        //pageContext.request.userPrincipal.getName()
        System.out.println("the name of :::");
        System.out.println(currentPrincipalName);
        //List<Rent> rents = rentService.getRentsByUserIdNotFinishedOrderByDate();
        return "dashboard";
    }
}
