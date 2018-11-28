package com.upem.rentacar.service.cars_management;

import com.upem.rentacar.model.gestion_utilisateurs.Utilisateur;
import com.upem.rentacar.model.gestion_vehicules.Car;

import java.util.List;

public interface CarsService {

    public List<Car> getAllCars();
    public List<Car> getAllCarsNotSold();
    public List<Car> getAllCarsForSaleNotSold();

    public Car createCar(Car car);
    public Car deleteCar(Car car);
    public Car deleteCarById(Long id);

    public Car getCarById(Long id);
    public List<Car> getCarByModel(String model);

}

