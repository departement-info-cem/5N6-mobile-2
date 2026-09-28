---
description: Appels à des WebAPI avec avec DIO
hide_table_of_contents: true
---

# Appels HTTP 👆

:::tip Avant la séance

Ce n'est pas le premier cours où vous allez faire des requêtes HTTP. Si vous avez bien compris les notions de vos cours de [4W6 - Programmation Web Orientée Services](https://info.cegepmontpetit.ca/4W6-WebServices/) et [4M6 - Applications Mobiles](https://info.cegepmontpetit.ca/4M6-Mobile/), vous risquez de vous y retrouver asser bien dans le cours d'aujourd'hui.

Si en web service et applications mobiles la librairie à utiliser pour faire des requêtes HTTP était axios et Retrofit, en Flutter c'est [dio](https://pub.dev/packages/dio) que nous allons privilégier.

Puisque nous considérons que vous commencez à être habitués aux requêtes HTTP, nous allons essayer d'aller un peu plus loins pour que ce qui l'entoure soit plus propre.

Consultez, et exécutez le code des recettes suivantes :

- [Configurations 🧑‍🔧](../03-recettes/configuration.md)
- [Secrets 🤫](../03-recettes/secret.md)
- [Bruno 🐕](../03-recettes/bruno.md)
- [Appels HTTP avec DIO 🙏](../03-recettes/http.md)
:::

:::info Séance

Nous verrons la différence entre les secrets vs la configuration.

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
