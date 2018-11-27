package com.upem.rentacar.model.somebank;



import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.sql.Date;


@Entity
@Table(name="BankTransaction")
public class BankTransaction {
    @TableGenerator(name = "BankTransactionGen", allocationSize = 1)
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE, generator = "BankTransactionGen")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "source_account")
    @JsonManagedReference
    private BankAccount source_account;

    @ManyToOne
    @JoinColumn(name = "destination_account")
    @JsonManagedReference
    private BankAccount destination_account;


    @Column(name = "transaction_amount")
    private Double transaction_amount;

    @ManyToOne
    @JoinColumn(name = "transaction_currency")
    @JsonManagedReference
    private BankCurrency transaction_currency;


    @Column(name = "transaction_time")
    private Date transaction_time;


    public BankAccount getSource_account() {
        return source_account;
    }

    public void setSource_account(BankAccount source_account) {
        this.source_account = source_account;
    }

    public BankAccount getDestination_account() {
        return destination_account;
    }

    public void setDestination_account(BankAccount destination_account) {
        this.destination_account = destination_account;
    }

    public Double getTransaction_amount() {
        return transaction_amount;
    }

    public void setTransaction_amount(Double transaction_amount) {
        this.transaction_amount = transaction_amount;
    }

    public BankCurrency getTransaction_currency() {
        return transaction_currency;
    }

    public void setTransaction_currency(BankCurrency transaction_currency) {
        this.transaction_currency = transaction_currency;
    }

    public Date getTransaction_time() {
        return transaction_time;
    }

    public void setTransaction_time(Date transaction_time) {
        this.transaction_time = transaction_time;
    }
}
