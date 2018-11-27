package com.upem.rentacar.service.somebank;


import com.upem.rentacar.model.somebank.BankAccount;

public interface BankAccountService {
    public BankAccount createBankAccount(BankAccount bankAccount);
    public BankAccount getBankAccountById(Long id);

}
