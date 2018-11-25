package com.upem.rentacar.model.gestion_vehicules;


import com.fasterxml.jackson.annotation.JsonBackReference;
import org.springframework.stereotype.Controller;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Car")
public class Car {


    @TableGenerator(name = "CarGen", allocationSize = 1)
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE, generator = "CarGen")
    private Long id;

    //Caracteristics
    @Column(name = "description")
    private String description;
    @Column(name = "model")
    private String model;
    @Column(name = "brand")
    private String brand;
    @Column(name = "cylinders_number")
    private int cylinders_number;
    @Column(name = "soupapes_number")
    private  int soupapes_number;
    @Column(name = "cylinder_size")
    private  int cylinder_size;
    @Column(name = "din_power")
    private  String din_power;
    @Column(name = "motors_couple")
    private  String motors_couple;
    @Column(name = "max_speed")
    private  int max_speed;
    @Column(name = "acceleration")
    private  double acceleration;
    //Evaluation
    @Column(name = "evaluation")
    private  double evaluation;
    @Column(name = "for_sell")
    private  boolean for_sell;
    @Column(name = "sold")
    private  boolean sold;
    @Column(name = "circulation_year")
    private Integer circulation_year;

    @Column(name = "rent_price")
    private Double rent_price;
    @Column(name = "sell_price")
    private Double sell_price;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    @OneToMany
    @JsonBackReference
    private List<Rent> car_rents;

    public List<Rent> getCar_rents() {
        return car_rents;
    }



    public Double getRent_price() {
        return rent_price;
    }

    public void setRent_price(Double rent_price) {
        this.rent_price = rent_price;
    }

    public Double getSell_price() {
        return sell_price;
    }

    public void setSell_price(Double sell_price) {
        this.sell_price = sell_price;
    }



    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getCylinders_number() {
        return cylinders_number;
    }

    public void setCylinders_number(int cylinders_number) {
        this.cylinders_number = cylinders_number;
    }

    public int getSoupapes_number() {
        return soupapes_number;
    }

    public void setSoupapes_number(int soupapes_number) {
        this.soupapes_number = soupapes_number;
    }

    public int getCylinder_size() {
        return cylinder_size;
    }

    public void setCylinder_size(int cylinder_size) {
        this.cylinder_size = cylinder_size;
    }

    public String getDin_power() {
        return din_power;
    }

    public void setDin_power(String din_power) {
        this.din_power = din_power;
    }

    public Integer getCirculation_year() {
        return circulation_year;
    }

    public void setCirculation_year(Integer circulation_year) {
        this.circulation_year = circulation_year;
    }

    public String getMotors_couple() {
        return motors_couple;
    }

    public void setMotors_couple(String motors_couple) {
        this.motors_couple = motors_couple;
    }

    public int getMax_speed() {
        return max_speed;
    }

    public void setMax_speed(int max_speed) {
        this.max_speed = max_speed;
    }

    public double getAcceleration() {
        return acceleration;
    }

    public void setAcceleration(double acceleration) {
        this.acceleration = acceleration;
    }

    public double getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(double evaluation) {
        this.evaluation = evaluation;
    }

    public boolean isFor_sell() {
        return for_sell;
    }

    public void setFor_sell(boolean for_sell) {
        this.for_sell = for_sell;
    }

    public boolean isSold() {
        return sold;
    }

    public void setSold(boolean sold) {
        this.sold = sold;
    }
}
