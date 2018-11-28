package com.upem.rentacar.service.somebank;

import com.upem.rentacar.model.somebank.BankAccount;
import com.upem.rentacar.repository.somebank.BankAccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("bankAccountService")
public class BankAccountServiceImpl implements BankAccountService {

    @Autowired
    private BankAccountRepository bankAccountRepository;

    public BankAccount createBankAccount(BankAccount bankAccount) {
        return bankAccountRepository.save(bankAccount);
    }


    public BankAccount getBankAccountById(Long id) {
        return bankAccountRepository.getOne(id);
    }
}
