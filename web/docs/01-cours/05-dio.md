---
description: Appels HTTP
hide_table_of_contents: true
---

# HTTP, accès réseau client et JSON

<Row>

<Column>

:::tip Avant la séance : théorie (2h)

ATTENTION: Tous les liens vers le site 4n6.azure... ne marchent plus, remplacer par https://fourn6-mobile-prof.onrender.com/

Vous devez regarder les videos suivantes:

<Video url="https://youtu.be/ZPbeMhcKITE" />

**[code accès simple](https://github.com/departement-info-cem/5N6-mobile-2-Nouveau/tree/main/code/http/01-acces_simple)**

<Video url="https://youtu.be/23q3vKf7lpA" />

**[objet JSON et liste](https://github.com/departement-info-cem/5N6-mobile-2-Nouveau/tree/main/code/http/02-json_list)**

<Video url="https://youtu.be/cukpZ2ORbsI" />

**[Envoi POST et gestion des erreurs](https://github.com/departement-info-cem/5N6-mobile-2/tree/main/code/http/03-post_json_erreur)**

<Video url="https://youtu.be/DRhf5rFLvgI" />

**[Gestion des cookies](https://github.com/departement-info-cem/5N6-mobile-2-Nouveau/tree/main/code/http/04-cookie_devtools)**

Pour avoir un exemple de sérialisation des dates en JSON vous pouvez regarder les **TODO** dans l'exemple suivant:

**[Gestion des dates](https://github.com/departement-info-cem/5N6-mobile-2/tree/main/code/http/05-date_json)**

:::

</Column>

<Column>

:::info Séance 1

On expliquera comment envoyer une requête HTTP aux web services des exercices et réceptionner le résultat.

On verra comment mettre en place des points d'arrêt et autres outils pour déboguer des appels réseau qui ne marchent pas encore.

Vous travaillerez sur les exercices.

:::

:::info Séance 2

On expliquera à quoi servent les différentes classes de transfert et comment fonctionne la génération de code pour JSON.

On fera une démo sur la personnalisation de la sérialisation d'une propriété qui nous sera utile pour sérialiser les dates.

Vous finirez vos exercices si nécessaire et vous avancerez les appels HTTP et classes de transfert pour votre TP.

:::
:::danger Commande pour générer les méthodes de sérialisation

```bash
flutter pub run build_runner build
```

:::

</Column>

</Row>

::::note Exercices

:::warning Attention!
Nous utiliserons plusieurs web service hébergés sur Render au courant de la session.
Notez que les webservices hébergés sur Render se ferment après un certain délais où il n'y a pas eu de requêtes.
Une requête envoyée au serveur va le "réveiller", mais ça peut prendre quelques minutes.
Donc si vous faites les exercices chez vous ou que vous êtes un des premiers dans un cours à travailler sur des exercices qui utilisent render, c'est normal que les premières requêtes échouent, le temps que le serveur se "réchauffe".
:::

### Exercice http_simple

Vous trouverez à l'url [https://fourn6-mobile-prof.onrender.com/exos/long/double/4](https://fourn6-mobile-prof.onrender.com/exos/long/double/4) un web service qui double la valeur du nombre qu'on lui passe.

Tu dois démontrer un appel avec succès à ce web service dans une application Flutter en envoyant la valeur d'un nombre et en affichant son double dans l'interface.

### Exercice api_github

Créez un projet appelé **api_github**.

Votre projet doit avoir un écran avec un champ texte, un bouton et une liste. On rentre le nom d'utilisateur dans le champ texte, on appuie sur le bouton pour envoyer la demande à l'API et au retour de la liste, elle doit s'afficher dans l'interface graphique.

Dans la liste on doit voir dans un ListTile le nom (name) du repo et s'il est privé ou non.

L'URL pour les données est la suivante (exemple pour l'utilisateur departement-info-cem)

```text
https://api.github.com/users/departement-info-cem/repos
```

::::
