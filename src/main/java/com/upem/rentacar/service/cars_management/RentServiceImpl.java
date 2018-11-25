package com.upem.rentacar.service.cars_management;

import com.upem.rentacar.model.gestion_vehicules.Rent;
import com.upem.rentacar.repository.cars_management.RentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("rentManagementService")
public class RentServiceImpl  implements RentService{

    @Autowired
    private RentRepository rentRepository;


    public List<Rent> getRents() {
        return rentRepository.findAll();
    }


    public Rent createRent(Rent rent) {
        return rentRepository.save(rent);
    }


    public Rent deleteRent(Rent rent) {
        try{
            rentRepository.delete(rent);
            return rent;
        }catch (Exception e){
            return null;
        }
    }

    public Rent deleteRentById(Long id) {
        try {
            rentRepository.delete(id);
            return new Rent();
        }catch (Exception e){
            return null;
        }
    }


    public Rent getRentById(Long id) {
        return rentRepository.getOne(id);
    }

    public List<Rent> getRentsByCarId(Long car_id) {
        return rentRepository.getRentsByCarId(car_id);
    }


    public List<Rent> getRentsByCarIdOrderByDate(Long car_id) {
        return rentRepository.getRentsByCarIdOrderByDate(car_id);
    }


    public List<Rent> getRentsByCarIdNotFinishedOrderByDate(Long car_id) {
        return rentRepository.getRentsByCarIdNotFinishedOrderByDate(car_id);
    }

    public List<Rent> getRentsByCarIdUserIdNotFinishedOrderByDate(Long car_id, Long user_id) {
        return rentRepository.getRentsByCarIdUserIdNotFinishedOrderByDate(car_id,user_id);
    }

    public List<Rent> createRents(List<Rent> rents) {
        return rentRepository.save(rents);
    }

}
