# 📦 5.2B – firebase_modelisation

## Objectif 🎯

Apprendre à structurer et gérer des données avec Firestore (la base de données NoSQL orientée documents de Firebase).

## À faire 🛠️

### Prérequis

Avoir complété la configuration Firestore de base.

### Étape 1 - Identifier mes documents

On va procéder en encadrant les choses, les trucs qui vont constituer le modèle. On va aussi souligner les verbes d'action, pour identifier les opérations que l'on veut faire sur nos données.

Mon application gère mes ⟦amis⟧, je peux <u>ajouter</u> un ⟦ami⟧, <u>lister</u> mes ⟦amis⟧, <u>préparer</u> un message perso pour un ⟦ami⟧, voir les amis dont l' ⟦anniversaire⟧ tombe bientôt. Je veux aussi pouvoir <u>chercher</u> un ⟦ami⟧.

Chaque ⟦ami⟧ a un ensemble de ⟦notes⟧, je peux <u>créer</u> une nouvelle ⟦note⟧ pour un ⟦ami⟧, <u>lister</u> les ⟦notes⟧ d'un ⟦ami⟧, <u>modifier</u> une ⟦note⟧ ou la <u>supprimer</u>.


Cela nous donne une liste initiale de documents potentiels:
- ⟦ami⟧
- ⟦note⟧
- ⟦message perso⟧
- ⟦anniversaire⟧

Et une liste initiale d'opérations sur ces documents:
- ajouter un ami
- lister mes amis
- chercher un ami
- lister les amis dont l'anniversaire tombe bientôt
- créer une note pour un ami
- lister les notes d'un ami
- modifier une note
- supprimer une note

### Étape 2 - identifier les champs de mes documents

On va vouloir pour chaque document identifier les champs:
- on veut tous les champs nécessaires pour toutes les actions de l'application
- on ne veut pas les champs qui ne servent à rien.

Par exemple, pour le document ⟦ami⟧:
- je veux avoir un nom et sans doute un prénom pour chercher un ami
- je veux avoir un identifiant unique pour chaque ami, parce que les IDs c'est la vie
- je veux avoir un champ pour la date de naissance, parce que je vais vouloir que l'application me notifie des anniversaires.
- je NE veux PAS avoir leurs poids, couleur de cheveux etc.
- modéliser c'est choisir

Ensuite, il y a les documents qui peuvent être des champs:
- je pourrais avoir un document ⟦anniversaire⟧, 
- mais je peux aussi juste avoir un champ date de naissance dans le document ⟦ami⟧. 
- Je choisis la deuxième option.

### Étape 3 - penser mes relations

Dans notre modèle, un ⟦ami⟧ peut avoir plusieurs ⟦notes⟧. 
Cela signifie qu'il y a une relation de type "un à plusieurs" entre les documents ⟦ami⟧ et ⟦note⟧.

Dans le paradigme orienté documents de Firestore, on peut modéliser cette relation de deux façons:
1. En créant une collection de ⟦notes⟧ imbriquée dans le document ⟦ami⟧. 
2. En créant une collection de �⟦notes⟧ séparée, avec un champ dans chaque ⟦note�⟧ qui référence l'ID de l'⟦ami⟧ auquel elle appartient.

Comment choisir:
- si les notes sont exclusives à un ami, que je ne les partagerai pas entre amis, et que je veux les récupérer souvent avec l'ami, je vais les mettre dans une sous-collection.
- si les notes étaient collaboratives / partageables, ce serait bizarre de les mettre dans un document pour avoir d'autres documents qui pointent vers.

Si on a une relation de type n à n, on ne peut pas faire de sous-collection, il faut faire une collection séparée avec des documents contenant des références.

Dans ce cas cela ressemble à une table de relation en SQL.

### Étape 4 - écrire le code 

Dans un premier temps, je peux me faire un fichier `models.dart` pour contenir mes classes de modèle.

```dart
class Ami {
  String id;
  String nom;
  String prenom;
  DateTime dateNaissance;   
}
class Note { // pas besoin de référence à un ami parce que ce sera dans une sous-collection
  String id;
  String contenu;
  DateTime dateCreation;
}
class MessagePerso {
  String id;
  String contenu;
  DateTime dateEnvoi;
}
```

On va aussi pouvoir se faire un service.dart avec les fonctions à implémenter pour faire les opérations sur les documents.

```dart
class Service {
  Future<void> ajouterAmi(Ami ami) async {
    // code pour ajouter un ami dans Firestore
  }
  Future<List<Ami>> listerAmis() async {
    // code pour lister les amis dans Firestore
  }
  Future<Ami?> chercherAmi(String id) async {
    // code pour chercher un ami par ID dans Firestore
 }
  Future<List<Ami>> listerAmisAnniversaireProche() async {
      // code pour lister les amis dont l'anniversaire tombe bientôt
  }
  
  Future<void> creerNotePourAmi(String amiId, Note note) async {
    // code pour créer une note pour un ami dans Firestore
  }
  Future<List<Note>> listerNotesPourAmi(String amiId) async {
  
  }
  ....
}
```

Restera alors à implanter tout ça en Firestore, mais on a déjà une bonne idée de la structure de nos documents et de nos collections.