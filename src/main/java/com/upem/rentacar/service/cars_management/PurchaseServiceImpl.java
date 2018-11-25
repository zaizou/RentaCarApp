package com.upem.rentacar.service.cars_management;

import com.upem.rentacar.model.gestion_vehicules.Purchase;
import com.upem.rentacar.repository.cars_management.PurchaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("purchaseManagementService")
public class PurchaseServiceImpl implements PurchaseService {
    @Autowired
    private PurchaseRepository purchaseRepository;

    @Override
    public List<Purchase> listUserPurchases(Long user_id) {
        return purchaseRepository.getPurchasesByCarIdOrderByDate(user_id);
    }

    @Override
    public Purchase createPurchase(Purchase purchase) {
        return purchaseRepository.save(purchase);
    }

    @Override
    public Purchase deletePurchase(Purchase purchase) {
        try{
            purchaseRepository.delete(purchase);
            return new Purchase();

        }catch (Exception e){
            return null;
        }
    }


    public Purchase deletePurchaseById(Long purchase_id) {
        try{
            purchaseRepository.delete(purchase_id);
            return new Purchase();

        }catch (Exception e){
            return null;
        }
    }
}
