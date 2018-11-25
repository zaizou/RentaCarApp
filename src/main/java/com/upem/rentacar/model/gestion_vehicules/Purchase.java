package com.upem.rentacar.model.gestion_vehicules;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.upem.rentacar.model.gestion_utilisateurs.Utilisateur;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "Purchase")
public class Purchase {

    @TableGenerator(name = "PurchaseGen", allocationSize = 1)
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE, generator = "PurchaseGen")
    private Long id;


    @ManyToOne
    @JoinColumn(name = "car_id")
    @JsonManagedReference
    private Car car_id;


    @ManyToOne
    @JoinColumn(name = "user_id")
    @JsonManagedReference
    private Utilisateur user_id;

    @Column(name = "purchase_price")
    private Double purchase_price;

    @Column(name = "purchase_date")
    private Date purchase_date;


    public Car getCar_id() {
        return car_id;
    }

    public void setCar_id(Car car_id) {
        this.car_id = car_id;
    }

    public Utilisateur getUser_id() {
        return user_id;
    }

    public void setUser_id(Utilisateur user_id) {
        this.user_id = user_id;
    }

    public Double getPurchase_price() {
        return purchase_price;
    }

    public void setPurchase_price(Double purchase_price) {
        this.purchase_price = purchase_price;
    }

    public Date getPurchase_date() {
        return purchase_date;
    }

    public void setPurchase_date(Date purchase_date) {
        this.purchase_date = purchase_date;
    }
}


