package com.upem.rentacar.service.somebank;

import com.upem.rentacar.model.somebank.BankCurrency;
import com.upem.rentacar.repository.somebank.BankCurrencyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bankCurrencyService")
public class BankCurrencyServiceImpl implements BankCurrencyService{

    @Autowired
    private BankCurrencyRepository bankCurrencyRepository;


    public List<BankCurrency> getAllCurrencies() {
        return bankCurrencyRepository.findAll();
    }


    public BankCurrency getCurrencyByName(String name) throws NullPointerException,ArrayIndexOutOfBoundsException {
        return bankCurrencyRepository.getBankCurrencyByCurrencyName(name).get(0);
    }
}
