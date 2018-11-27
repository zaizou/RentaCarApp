package com.upem.rentacar.model.somebank;

import javax.persistence.*;

@Entity
@Table(name = "BankCurrency")
public class BankCurrency {

    @TableGenerator(name = "BankTransactionGen", allocationSize = 1)
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE, generator = "BankTransactionGen")
    private Long id;

    @Column(name = "currency_name")
    private String currency_name;

    @Column(name = "currency_exchange_rate")
    private Double currency_exchange_rate;

    public String getCurrency_name() {
        return currency_name;
    }

    public void setCurrency_name(String currency_name) {
        this.currency_name = currency_name;
    }

    public Double getCurrency_exchange_rate() {
        return currency_exchange_rate;
    }

    public void setCurrency_exchange_rate(Double currency_exchange_rate) {
        this.currency_exchange_rate = currency_exchange_rate;
    }



}
