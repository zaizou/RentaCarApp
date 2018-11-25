package com.upem.rentacar.repository.user_management;

import com.upem.rentacar.model.gestion_utilisateurs.Fonctionnalite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FonctionnaliteRepository extends JpaRepository<Fonctionnalite,String> {
	Fonctionnalite save(Fonctionnalite fonctionnalite);

	@Query("SELECT c FROM Fonctionnalite c WHERE (c.designation) = (:designation)")
	public List<Fonctionnalite> getFonctionnaliteByDesignation(@Param("designation") String designation);


	@Query("SELECT c FROM Fonctionnalite c WHERE (c.idFonctionnalite) = (:idFonctionnalite)")
	public List<Fonctionnalite> getFonctionnaliteById(@Param("idFonctionnalite") Integer idFonctionnalite);

}
