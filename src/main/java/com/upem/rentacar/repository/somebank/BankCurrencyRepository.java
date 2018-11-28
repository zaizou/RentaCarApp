package com.upem.rentacar.repository.somebank;

import com.upem.rentacar.model.somebank.BankCurrency;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BankCurrencyRepository extends JpaRepository<BankCurrency,Long> {

    @Query("SELECT c FROM BankCurrency c WHERE (c.currency_name) = (:currency_name)")
    public List<BankCurrency> getBankCurrencyByCurrencyName(@Param("currency_name") String currency_name);

}
