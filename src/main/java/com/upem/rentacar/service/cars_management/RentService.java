package com.upem.rentacar.service.cars_management;

import com.upem.rentacar.model.gestion_vehicules.Rent;

import java.util.List;

public interface RentService {

    public List<Rent> getRents();
    public Rent createRent(Rent rent);
    public Rent deleteRent(Rent rent);
    public Rent deleteRentById(Long id);
    public Rent getRentById(Long id);
    public List<Rent> getRentsByCarId(Long car_id);
    public List<Rent> getRentsByCarIdOrderByDate(Long car_id);
    public List<Rent> getRentsByCarIdNotFinishedOrderByDate(Long car_id);
    public List<Rent> getRentsByCarIdUserIdNotFinishedOrderByDate(Long car_id, Long user_id);
    public List<Rent> createRents(List<Rent> rents);
    public List<Rent> getRentsByUserIdNotFinishedOrderByDate(Long user_id);







}
