package com.upem.rentacar.model.somebank;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "BankAccount ")
public class BankAccount {

    @TableGenerator(name = "BankAccountGen", allocationSize = 1)
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE, generator = "BankAccountGen")
    private Long id;


    @Column(name = "account_number")
    private String account_number;

    @Column(name = "full_name")
    private String full_name;
    @Column(name = "expiration_date")
    private Date expiration_date;
    @Column(name = "cvc")
    private String cvc;


    public String getAccount_number() {
        return account_number;
    }

    public void setAccount_number(String account_number) {
        this.account_number = account_number;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public Date getExpiration_date() {
        return expiration_date;
    }

    public void setExpiration_date(Date expiration_date) {
        this.expiration_date = expiration_date;
    }

    public String getCvc() {
        return cvc;
    }

    public void setCvc(String cvc) {
        this.cvc = cvc;
    }
}
