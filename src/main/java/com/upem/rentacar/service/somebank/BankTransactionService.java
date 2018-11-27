package com.upem.rentacar.service.somebank;

import com.upem.rentacar.model.somebank.BankTransaction;

public interface BankTransactionService {

    public BankTransaction commitTransaction(BankTransaction transaction);

}
