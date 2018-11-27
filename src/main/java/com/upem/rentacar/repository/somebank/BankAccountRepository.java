package com.upem.rentacar.repository.somebank;

import com.upem.rentacar.model.somebank.BankAccount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


public interface BankAccountRepository  extends JpaRepository<BankAccount,Long> {

}
