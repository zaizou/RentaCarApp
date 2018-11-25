package com.upem.rentacar.repository.cars_management;

import com.upem.rentacar.model.gestion_vehicules.Rent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RentRepository extends JpaRepository<Rent,Long> {
    Rent save(Rent rent);
    void delete(Rent rent);
    List<Rent> findAll();



    @Query("SELECT r FROM Rent r WHERE r.car_id.id = (:car_id)")
    public List<Rent> getRentsByCarId(@Param("car_id") Long car_id);

    @Query("SELECT r FROM Rent r WHERE r.car_id.id = (:car_id) ORDER BY r.date_from asc")
    public List<Rent> getRentsByCarIdOrderByDate(@Param("car_id") Long car_id);

    @Query("SELECT r FROM Rent r WHERE r.car_id.id = (:car_id) AND NOT r.finished= true   ORDER BY r.date_from asc")
    public List<Rent> getRentsByCarIdNotFinishedOrderByDate(@Param("car_id") Long car_id);

    @Query("SELECT r FROM Rent r WHERE r.car_id.id = (:car_id) AND r.user_id.id = (:user_id) AND NOT r.finished= true   ORDER BY r.date_from asc")
    public List<Rent> getRentsByCarIdUserIdNotFinishedOrderByDate(@Param("car_id") Long car_id,@Param("user_id") Long user_id);



}
