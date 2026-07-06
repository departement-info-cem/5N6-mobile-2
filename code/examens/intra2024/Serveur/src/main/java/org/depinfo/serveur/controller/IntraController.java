package org.depinfo.serveur.controller;

import org.depinfo.serveur.model.Animal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class IntraController {

    private final List<Animal> animaux = new ArrayList<>();

    public IntraController() {
        animaux.add(new Animal("Léo", "Lion", "Felidae", "Afrique"));
        animaux.add(new Animal("Ella", "Éléphant", "Éléphantidés", "Afrique"));
        animaux.add(new Animal("Manny", "Mammouth", "Éléphantidés", "Amérique"));
        animaux.add(new Animal("Shira", "Tigre", "Felidae", "Asie"));
        animaux.add(new Animal("Zazu", "Perroquet", "Psittacidae", "Amérique"));
        animaux.add(new Animal("Koko", "Gorille", "Hominidés", "Afrique"));
        animaux.add(new Animal("Rango", "Iguane", "Iguanidae", "Amérique"));
        animaux.add(new Animal("Baloo", "Ours", "Ursidés", "Asie"));
        animaux.add(new Animal("Fiona", "Hippopotame", "Hippopotamidés", "Afrique"));
        animaux.add(new Animal("Alex", "Pingouin", "Sphéniscidés", "Antarctique"));
        animaux.add(new Animal("Benny", "Guépard", "Felidae", "Afrique"));
        animaux.add(new Animal("Raja", "Tigre", "Felidae", "Asie"));
        animaux.add(new Animal("Dumbo", "Éléphant", "Éléphantidés", "Asie"));
        animaux.add(new Animal("Timon", "Suricate", "Herpestidés", "Afrique"));
        animaux.add(new Animal("Pumbaa", "Phacochère", "Suidae", "Afrique"));
        animaux.add(new Animal("Rafiki", "Babouin", "Cercopithécidés", "Afrique"));
        animaux.add(new Animal("Diego", "Tigre à dents de sabre", "Felidae", "Amérique"));
        animaux.add(new Animal("Simba", "Lion", "Felidae", "Afrique"));
        animaux.add(new Animal("Milo", "Léopard", "Felidae", "Afrique"));
        animaux.add(new Animal("Toto", "Hyène", "Hyaenidés", "Afrique"));
        animaux.add(new Animal("Bruce", "Requin", "Selachimorpha", "Océans"));
        animaux.add(new Animal("Dory", "Poisson", "Pomacentridae", "Océans"));
        animaux.add(new Animal("Marlin", "Poisson-clown", "Pomacentridae", "Océans"));
        animaux.add(new Animal("Crush", "Tortue de mer", "Cheloniidae", "Océans"));
        animaux.add(new Animal("Sven", "Renne", "Cervidae", "Europe"));
        animaux.add(new Animal("Olaf", "Harfang des neiges", "Strigidés", "Amérique"));
        animaux.add(new Animal("Archie", "Oryctérope", "Tubulidentata", "Afrique"));
        animaux.add(new Animal("Bambi", "Cerf", "Cervidae", "Amérique"));
        animaux.add(new Animal("Skipper", "Pingouin", "Sphéniscidés", "Antarctique"));
        animaux.add(new Animal("Akela", "Loup", "Canidés", "Europe"));
        animaux.add(new Animal("Bagheera", "Panthère", "Felidae", "Asie"));
        animaux.add(new Animal("Baloo", "Ours brun", "Ursidés", "Asie"));
        animaux.add(new Animal("Kaa", "Serpent", "Boidae", "Asie"));
        animaux.add(new Animal("Shere Khan", "Tigre du Bengale", "Felidae", "Asie"));
        animaux.add(new Animal("King Louie", "Orang-outan", "Hominidés", "Asie"));
        animaux.add(new Animal("Mufasa", "Lion", "Felidae", "Afrique"));
        animaux.add(new Animal("Nala", "Lionne", "Felidae", "Afrique"));
        animaux.add(new Animal("Zira", "Lionne", "Felidae", "Afrique"));
        animaux.add(new Animal("Sarabi", "Lionne", "Felidae", "Afrique"));
        animaux.add(new Animal("Toulouse", "Chat", "Felidae", "Europe"));
        animaux.add(new Animal("Duchesse", "Chat", "Felidae", "Europe"));
        animaux.add(new Animal("Marie", "Chat", "Felidae", "Europe"));
        animaux.add(new Animal("Remy", "Rat", "Muridae", "Europe"));
        animaux.add(new Animal("Emile", "Rat", "Muridae", "Europe"));
        animaux.add(new Animal("Dingo", "Chien", "Canidés", "Amérique"));
        animaux.add(new Animal("Pluto", "Chien", "Canidés", "Amérique"));
        animaux.add(new Animal("Pegase", "Cheval ailé", "Équidés", "Europe"));
        animaux.add(new Animal("Abu", "Singe", "Cercopithécidés", "Asie"));
        animaux.add(new Animal("Iago", "Perroquet", "Psittacidae", "Asie"));
        animaux.add(new Animal("Rajah", "Tigre", "Felidae", "Asie"));
        animaux.add(new Animal("Flounder", "Poisson", "Pomacentridae", "Océans"));
        animaux.add(new Animal("Sebastian", "Crabe", "Decapoda", "Océans"));
        animaux.add(new Animal("Scuttle", "Mouette", "Laridae", "Océans"));
        animaux.add(new Animal("Tantor", "Éléphant", "Éléphantidés", "Afrique"));
        animaux.add(new Animal("Kala", "Gorille", "Hominidés", "Afrique"));
        animaux.add(new Animal("Kerchak", "Gorille", "Hominidés", "Afrique"));
        animaux.add(new Animal("Sabor", "Léopard", "Felidae", "Afrique"));
        animaux.add(new Animal("Terk", "Gorille", "Hominidés", "Afrique"));
        animaux.add(new Animal("Pégase", "Cheval", "Équidés", "Europe"));
        animaux.add(new Animal("Maximus", "Cheval", "Équidés", "Europe"));
        animaux.add(new Animal("Pascal", "Caméléon", "Chamaeleonidae", "Europe"));
        animaux.add(new Animal("Bullseye", "Cheval", "Équidés", "Amérique"));
        animaux.add(new Animal("Pua", "Cochon", "Suidae", "Océanie"));
        animaux.add(new Animal("Heihei", "Coq", "Gallinacés", "Océanie"));
        animaux.add(new Animal("Sven", "Renne", "Cervidae", "Europe"));
        animaux.add(new Animal("Marahute", "Aigle", "Accipitridae", "Océanie"));
    }

    @GetMapping("/exam/animaux/{continent}")
    public @ResponseBody List<Animal> getAnimaux(@PathVariable String continent, @RequestParam(required = false) String famille) {

        return animaux.stream()
                .filter(animal -> (famille == null || famille.equalsIgnoreCase("")) || animal.getFamille().equalsIgnoreCase(famille))
                .filter(animal -> continent.equalsIgnoreCase("monde") || animal.getContinent().equalsIgnoreCase(continent))
                .collect(Collectors.toList());
    }
}

