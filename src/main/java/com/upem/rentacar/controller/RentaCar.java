package com.upem.rentacar.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Yazid on 02/08/2016.
 */
@Controller
public class RentaCar {


    @RequestMapping(
            value = {"/home.html"},
            method = {RequestMethod.GET}
    )
    public String getNomenclaturesComptables(Model model) {
        System.out.println("Hello from there");
        return "home";
    }



}
