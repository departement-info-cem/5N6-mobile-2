---
description: Afficher une image
hide_table_of_contents: true
---

# 3.2 - Image Client 🖼️

:::tip Avant la séance

Lisez la documentation officielle à propos de la [classe MediaQuery](https://api.flutter.dev/flutter/widgets/MediaQuery-class.html). La petite vidéo est intéressante pour avoir un aperçu des fonctionnalités.

Il existe 3 principaux emplacements pour une image qu'on souhaite afficher :

1. **Assets** : Directement dans le projet de l'application. 
   - Lorsqu'on sait qu'on va avoir besoin de l'image.
   - Ex : le logo de l'application qui s'affiche dans la page d'accueil.
2. **Local (File)** : Sur le téléphone de l'utilisateur
   - Lorqu'on veut donner le choix à l'utilisateur de choisir lui-même une photo.
   - Ex : choisir sa photo de profil parmis ses fichiers, dans la page modifier le profil
   - Conseil : Si vous utilisez un émulteur, consultez la recette pour [Image sur un émulateur 🖼️](../03-recettes/image-emulateur.md)
3. **Sur le réseau (Network)** : Sur un réseau local, distant, ou internet.
   - Lorsqu'on veut afficher une photo qui n'est pas sur l'appareil de l'utilisateur.
   - Ex : afficher la photo de profil de l'utilisateur qu'il a préalablement téléversée.



Regardez le code de démo [image_client](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-image_client.zip). Vous devez cherchez les [TODO](../03-recettes/lancer-projet-fourni.md).

Pour l'affichage des images, on recommande cette librairie [cached_network_image](https://pub.dev/packages/cached_network_image)

:::

:::info Séance

On regardera les avantages et inconvénients d'utiliser des images avec une taille fixe ou dynamique.

On discutera des avantages de redimensionner des images.

On discutera du "caching" des images.

:::

:::note Exercices

### Exercice grosse_image

Utiliser l'URL [https://fourn6-mobile-prof.onrender.com/exos/image](https://fourn6-mobile-prof.onrender.com/exos/image) pour afficher au moins 20 images dans un ListView

Ajouter un paramètre à l'URL pour s'assurer que chaque image ne provient pas du cache, ça devrait rendre le tout désagréable à l'utilisation puisque l'image fait 10.5 mb

### Exercice redimensionnement

Faire 3 pages où vous n'aurez qu'à afficher l'image [https://fourn6-mobile-prof.onrender.com/exos/image](https://fourn6-mobile-prof.onrender.com/exos/image) avec la taille la plus grande possible.

- La première page affichera l'image en basse résolution.
- La deuxième page affichera l'image en moyenne résolution.
- La dernière page affichera l'image en résolution maximale

### Exercice differentes_tailles

Faire 2 pages.

- La première affichera l'image [https://fourn6-mobile-prof.onrender.com/exos/image](https://fourn6-mobile-prof.onrender.com/exos/image) le 1/3 de la largeur de l'écran
- La deuxième page affichera une image sur la moitié de la hauteur et la moitié de la largeur.

Pour vous aider, regarder la propriété BoxFit.

:::
