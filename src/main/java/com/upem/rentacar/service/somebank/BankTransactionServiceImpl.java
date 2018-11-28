package com.upem.rentacar.service.somebank;

import com.upem.rentacar.model.somebank.BankTransaction;
import com.upem.rentacar.repository.somebank.BankTransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("bankTransactionService")
public class BankTransactionServiceImpl  implements BankTransactionService{
    @Autowired
    private BankTransactionRepository bankTransactionRepository;

    public BankTransaction commitTransaction(BankTransaction transaction) {
        return bankTransactionRepository.save(transaction);
    }
}
