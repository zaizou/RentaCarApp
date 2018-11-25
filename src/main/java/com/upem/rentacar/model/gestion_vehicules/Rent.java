package com.upem.rentacar.model.gestion_vehicules;


import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.upem.rentacar.model.gestion_utilisateurs.Utilisateur;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "Rent")
public class Rent {

    @TableGenerator(name = "RentGen", allocationSize = 1)
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE, generator = "RentGen")
    private Long id;


    @Column(name = "date_from")
    private Date date_from;
    @Column(name = "date_to")
    private Date date_to;
    @Column(name = "days")
    private Integer days;
    @Column(name = "finished")
    private Boolean finished;
    @Column(name = "rent_price")
    private Double rent_price;
    @Column(name = "ordre")
    private  Integer ordre;



    @ManyToOne
    @JoinColumn(name = "car_id")
    @JsonManagedReference
    private Car car_id;


    @ManyToOne
    @JoinColumn(name = "user_id")
    @JsonManagedReference
    private Utilisateur user_id;


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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDate_from() {
        return date_from;
    }

    public void setDate_from(Date date_from) {
        this.date_from = date_from;
    }

    public Date getDate_to() {
        return date_to;
    }

    public void setDate_to(Date date_to) {
        this.date_to = date_to;
    }

    public Integer getDays() {
        return days;
    }

    public void setDays(Integer days) {
        this.days = days;
    }

    public Boolean getFinished() {
        return finished;
    }

    public void setFinished(Boolean finished) {
        this.finished = finished;
    }

    public Double getRent_price() {
        return rent_price;
    }

    public void setRent_price(Double rent_price) {
        this.rent_price = rent_price;
    }

    public Integer getOrdre() {
        return ordre;
    }

    public void setOrdre(Integer ordre) {
        this.ordre = ordre;
    }
}
