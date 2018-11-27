package com.upem.rentacar.repository.somebank;

import com.upem.rentacar.model.somebank.BankTransaction;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BankTransactionRepository extends JpaRepository<BankTransaction,Long> {

}
