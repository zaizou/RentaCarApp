package com.upem.rentacar.service.somebank;

import com.upem.rentacar.model.somebank.BankCurrency;

import java.util.List;

public interface BankCurrencyService {
    public List<BankCurrency> getAllCurrencies();
    public BankCurrency getCurrencyByName(String name);
}
