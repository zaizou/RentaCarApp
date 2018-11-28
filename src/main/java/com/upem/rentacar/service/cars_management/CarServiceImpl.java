package com.upem.rentacar.service.cars_management;

import com.upem.rentacar.model.gestion_vehicules.Car;
import com.upem.rentacar.repository.cars_management.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.ws.ServiceMode;
import java.util.List;

@Service("carsManagementService")
public class CarServiceImpl implements CarsService {

    @Autowired
    private CarRepository carRepository;


    public List<Car> getAllCars() {
        return carRepository.findAll();
    }


    public List<Car> getAllCarsNotSold() {
        return carRepository.getCarNotSold();
    }


    public List<Car> getAllCarsForSaleNotSold() {
        return carRepository.getCarForSellNotSold();
    }


    public Car createCar(Car car) {
        return carRepository.save(car);
    }


    public Car deleteCar(Car car) {
        try{
            carRepository.delete(car);
        }catch (Exception e){
            return null;
        }
        return new Car();
    }


    public Car deleteCarById(Long id) {
        try{
            carRepository.delete(id);
        }catch (Exception e){
            return null;
        }
        return new Car();
    }


    public Car getCarById(Long id) {
        return carRepository.getCarById(id);
    }


    public List<Car> getCarByModel(String model) {
        return carRepository.getCarByCarModel(model);
    }
}
