package com.upem.rentacar.repository.user_management;

import com.upem.rentacar.model.gestion_utilisateurs.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by Yazid on 17/06/2016.
 */
public interface UtilisateurRepository extends JpaRepository<Utilisateur,String> {
        Utilisateur save(Utilisateur chap);






@Query("SELECT  c FROM Utilisateur c WHERE c.id = (:user_id)")
public List<Utilisateur> getUtilisateurByIdUtilisateur(@Param("user_id") String user_id);


        @Query("SELECT c.id,c.nom,c.prenom FROM Utilisateur c ")
        public List<Utilisateur> getUtilisateursByIdNomPrenom();



        @Query("delete From Utilisateur u where u.id =   (:id_user) ")
        public void deleteById(@Param("id_user") String id_user);











        }