---
description: Appels à des WebAPI avec avec DIO
hide_table_of_contents: true
---

# Appels HTTP 👆

:::tip Avant la séance

Ce n'est pas le premier cours où vous allez faire des requêtes HTTP. Si vous avez bien compris les notions de vos cours de [4W6 - Programmation Web Orientée Services](https://info.cegepmontpetit.ca/4W6-WebServices/) et [4M6 - Applications Mobiles](https://info.cegepmontpetit.ca/4M6-Mobile/), vous risquez de vous y retrouver asser bien dans le cours d'aujourd'hui.

Si en web service et applications mobiles la librairie à utiliser pour faire des requêtes HTTP était axios et Retrofit, en Flutter c'est [dio](https://pub.dev/packages/dio) que nous allons privilégier.

Consultez, et si possible, exécutez le code des recettes suivantes :

- [DIO 1 - Requête GET de base](../03-recettes/dio-01-base.md)
- [DIO 2 - Appel depuis l'interface](../03-recettes/dio-02-objet.md)
- [DIO 3 - Objet et liste JSON](../03-recettes/dio-03-liste.md)
- [DIO 4 - POST et cookies](../03-recettes/dio-04-cookie-post.md)

Les projets de démonstration sont disponibles dans [code/http](https://github.com/departement-info-cem/5N6-mobile-2/tree/main/code/http).
:::

:::info Séance

Nous verrons comment 
- envoyer des requêtes HTTP aux services web avec **DIO**, 
- convertir les réponses JSON en objets Dart 
- afficher les résultats dans Flutter.

Complétez les exercices suivants :

- [🌐 6.1A – http_simple](../04-laboratoires/Laboratoire%206.1/a-http_simple.md)
- [🧩 6.1B – http_objet](../04-laboratoires/Laboratoire%206.1/b-http_objet.md)
- [📋 6.1C – http_listes](../04-laboratoires/Laboratoire%206.1/c-http_listes.md)
- [📤 6.1D – http_post](../04-laboratoires/Laboratoire%206.1/d-http_post.md)
- [🐙 6.1E – api_github](../04-laboratoires/Laboratoire%206.1/e-api_github.md)
- [🪪 6.1F – choix de DTO](../04-laboratoires/Laboratoire%206.1/f-dto.md)
:::

:::warning Services hébergés sur Render

Les services `fourn6-mobile-prof.onrender.com` peuvent s'arrêter après une période d'inactivité. La première requête les réveille et peut échouer ou prendre quelques minutes. Réessayez après un court délai avant de modifier votre code.
:::

:::info Génération de sérialisation JSON

Si vous utilisez `json_serializable`, générez les méthodes `fromJson` et `toJson` depuis le dossier du projet :

```bash
dart run build_runner build
```
:::
