package com.upem.rentacar.repository.cars_management;

import com.upem.rentacar.model.gestion_vehicules.Purchase;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PurchaseRepository extends JpaRepository<Purchase,Long> {

    @Query("SELECT pr FROM Purchase pr WHERE pr.user_id.id = (:user_id) ORDER BY pr.purchase_date desc ")
    public List<Purchase> getPurchasesByCarIdOrderByDate(@Param("user_id") Long user_id);


}
