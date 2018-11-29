package com.upem.rentacar.controller;


import com.upem.rentacar.model.gestion_utilisateurs.Utilisateur;
import com.upem.rentacar.model.gestion_vehicules.Car;
import com.upem.rentacar.model.gestion_vehicules.Purchase;
import com.upem.rentacar.model.gestion_vehicules.Rent;
import com.upem.rentacar.service.cars_management.CarsService;
import com.upem.rentacar.service.cars_management.PurchaseService;
import com.upem.rentacar.service.cars_management.RentService;
import com.upem.rentacar.service.users_management.GestionUtilisateursService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
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
    @Autowired
    private PurchaseService purchaseService;
    @Autowired
    private GestionUtilisateursService utilisateursService;

    @RequestMapping(value = {"management_gestion_dashboard.html"}, method = RequestMethod.GET)
    public String getUserDashboard(Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName =  authentication.getName();//authentication.getPrincipal().toString();
        //pageContext.request.userPrincipal.getName()
        System.out.println("the name of :::");
        System.out.println(currentPrincipalName);
        List<Rent> rents = rentService.getRentsByUserIdNotFinishedOrderByDate(currentPrincipalName);
        model.addAttribute("rents",rents);

        List<Purchase> purchases =purchaseService.listUserPurchases(currentPrincipalName);
        model.addAttribute("purchases",purchases);

        Utilisateur  user = utilisateursService.getUtilisateurByIdUtilisateur(currentPrincipalName).get(0);
        model.addAttribute("userCurrency",user.getCurrency_id());
        return "dashboard";
    }
}
