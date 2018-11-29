package com.upem.rentacar.service.cars_management;


import com.upem.rentacar.model.gestion_vehicules.Purchase;

import java.util.List;

public interface PurchaseService {
    public List<Purchase> listUserPurchases(String  user_id);
    public Purchase createPurchase(Purchase purchase);
    public Purchase deletePurchase(Purchase purchase);
    public Purchase deletePurchaseById(Long purchase_id);

}
