package org.depinfo.serveur.model;

public class Animal {
    private String nom;
    private String espece;
    private String famille;
    private String continent;

    // Constructeurs, getters et setters
    public Animal(String nom, String espece, String famille, String continent) {
        this.nom = nom;
        this.espece = espece;
        this.famille = famille;
        this.continent = continent;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getEspece() {
        return espece;
    }

    public void setEspece(String espece) {
        this.espece = espece;
    }

    public String getFamille() {
        return famille;
    }

    public void setFamille(String famille) {
        this.famille = famille;
    }

    public String getContinent() {
        return continent;
    }

    public void setContinent(String continent) {
        this.continent = continent;
    }
}
