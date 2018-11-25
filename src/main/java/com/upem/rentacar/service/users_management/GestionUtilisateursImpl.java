package com.upem.rentacar.service.users_management;

import com.upem.rentacar.model.gestion_utilisateurs.Fonctionnalite;
import com.upem.rentacar.model.gestion_utilisateurs.Notification;
import com.upem.rentacar.model.gestion_utilisateurs.Utilisateur;
import com.upem.rentacar.repository.user_management.FonctionnaliteRepository;
import com.upem.rentacar.repository.user_management.NotificationRepository;
import com.upem.rentacar.repository.user_management.UtilisateurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Yazid on 18/06/2016.
 */
@Service("gestionUtilisateurService")
public class GestionUtilisateursImpl implements GestionUtilisateursService {

    @Autowired
    private UtilisateurRepository utilisateurRepository;
    @Autowired
    private FonctionnaliteRepository fonctionnaliteRepository;
    @Autowired
    private NotificationRepository notificationRepository;




    public List<Utilisateur> getAllUtilisateurs() {
        return this.utilisateurRepository.findAll();
    }



    public Utilisateur creerUtilisateur(Utilisateur utilisateur) {
        return utilisateurRepository.save(utilisateur);
    }

    public String supprimerUtilisateur(Utilisateur utilisateur) {
        try{
            utilisateurRepository.delete(utilisateur);
            return utilisateur.getId();
        }catch (Exception e){
                e.printStackTrace();
                return null;
        }


    }

    public List<Fonctionnalite> getAllFonctionnalites() {
        return fonctionnaliteRepository.findAll();
    }

    public Fonctionnalite creerFonctionnalite(Fonctionnalite fonctionnalite) {
        return fonctionnaliteRepository.save(fonctionnalite);
    }

    public List<Fonctionnalite> getFonctionnalite(String nom) {
        return fonctionnaliteRepository.getFonctionnaliteByDesignation(nom);
    }

    public List<Fonctionnalite> getFonctionnaliteById(Integer id) {
        return fonctionnaliteRepository.getFonctionnaliteById(id);
    }

    public List<Utilisateur> getUtilisateurByIdUtilisateur(String id) {
        return utilisateurRepository.getUtilisateurByIdUtilisateur(id);
    }

    @Override
    public List<Utilisateur> getUtilisateursByIdNomPrenom() {
            //utilisateurRepository.de
        return utilisateurRepository.getUtilisateursByIdNomPrenom();
    }


    public List<Notification> getAllNotifications() {
        return notificationRepository.findAll();
    }

    public Notification creerNotification(Notification notification) {
        return notificationRepository.save(notification);
    }


}
