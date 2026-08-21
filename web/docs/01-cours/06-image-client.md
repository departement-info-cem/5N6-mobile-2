---
description: Afficher une image
hide_table_of_contents: true
---

# 3.2 - Image Client 🖼️

:::tip Avant la séance

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

:::

:::info Séance

Nous regarderons les avantages et inconvénients d'utiliser des images avec une taille fixe ou dynamique.

Nous discuterons des avantages de redimensionner des images côté client et côté serveur.

Nous discuterons du "caching" des images, et de la différence entre la stratégie de caching utilisée par Image.network (mémoire) versus celle utilisée par [CachedNetworkImage](https://pub.dev/packages/cached_network_image/) (disque).

Complétez les exercices suivants :

- [🔭 3.2A – grosse_image](../04-laboratoires/Laboratoire%203.2/a-grosse_image.md)
- [🤏 3.2B – redimensionnement](../04-laboratoires/Laboratoire%203.2/b-redimensionnement.md)


:::
