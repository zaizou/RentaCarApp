package com.upem.rentacar.service.users_management;

import com.upem.rentacar.model.gestion_utilisateurs.Fonctionnalite;
import com.upem.rentacar.model.gestion_utilisateurs.Notification;
import com.upem.rentacar.model.gestion_utilisateurs.Utilisateur;

import java.util.List;

/**
 * Created by Yazid on 18/06/2016.
 */
public interface GestionUtilisateursService {
    public List<Utilisateur> getAllUtilisateurs();
    public Utilisateur creerUtilisateur(Utilisateur utilisateur);
    public String supprimerUtilisateur(Utilisateur utilisateur);



    public List<Fonctionnalite> getAllFonctionnalites();
    public Fonctionnalite creerFonctionnalite(Fonctionnalite fonctionnalite);
    public List<Fonctionnalite> getFonctionnalite(String nom);
    public List<Fonctionnalite> getFonctionnaliteById(Integer id);

    public List<Utilisateur> getUtilisateurByIdUtilisateur(String id);
    public List<Utilisateur> getUtilisateursByIdNomPrenom();

    public List<Notification> getAllNotifications();
    public Notification creerNotification(Notification notification);



}
