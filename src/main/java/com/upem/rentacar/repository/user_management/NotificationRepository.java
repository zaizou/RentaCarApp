package com.upem.rentacar.repository.user_management;

import com.upem.rentacar.model.gestion_utilisateurs.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NotificationRepository extends JpaRepository<Notification,String> {
	Notification save(Notification notification);
}
