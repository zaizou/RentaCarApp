package com.upem.rentacar.repository.cars_management;


import com.upem.rentacar.model.gestion_vehicules.Car;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by Yazid on 17/06/2016.
 */
public interface CarRepository extends JpaRepository<Car,Long> {
        Car save(Car car);

        @Query("SELECT c FROM Car c WHERE c.id = (:car_id)")
        public Car getCarById(@Param("car_id") Long car_id);

        @Query("SELECT c FROM Car c WHERE c.sold = false ")
        public List<Car> getCarNotSold();

        @Query("SELECT c FROM Car c WHERE c.for_sell = true  AND c.sold = false ")
        public List<Car> getCarForSellNotSold();

        @Query("SELECT c FROM Car c WHERE c.model = (:car_model)")
        public List<Car> getCarByCarModel(@Param("car_model") String car_model);


        @Query("delete From Car c where c.id =   (:id_car) ")
        public void deleteById(@Param("id_car") Long id_car);











        }