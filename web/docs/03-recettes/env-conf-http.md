---
description: Effectuer une requête HTTP GET avec DIO
---

# Environnement, Configuration, et HTTP

## 1. Créer le projet 🆕

Dans Visual Studio Code, lancez la palette de commande, et sélectionner `Flutter : Create New Project`. Dans le template à choisir, sélectionnez `Empty Application`.

## 2. Environnement 🪙

Nous allons utiliser le service [REST Countries](https://restcountries.com/) comme service REST. Créez vous un compte, et trouvez la clé d'API créée par défaut. Elle devrait commencer par `rc_live`. Cette clé est votre **laissez-passer 🪪** pour intéragir avec l'API de REST Countries.

:::caution 
Ce token ne devrait jamais se retrouver sur GitHub. Si par mégarde, ça vous arrive, il faut immédiatement faire une **rotation** (générer une nouvelle clé et désactiver l'ancienne). Si ça arrive dans votre vie professionnelle, avertissez votre superviseur dans les plus brefs délais.
:::

### 2.1 `.env` 🏞️

Nous allons ajouter le token dans un fichier `.env` qui n'est qu'une liste de clé=valeur.

```env
REST_COUNTRIES_API_KEY=VOTRE_CLÉ_ICI!!!
```

Pour éviter que `.env` ne se retrouve dans votre repo git, ajoutons le à votre `.gitignore` :

```gitignore
// Reste des éléments ignorés

.env
```

### 3.2 `flutter_dotenv` 🐦🏞️

Le package [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv) va nous permettre d'utiliser les valeurs qui sont dans `.env` dans notre code.

Suivez les instructions sur la page du package pour compléter son installation. Un exemple est fourni pour utiliser la librairie.

### 3.3 Bonus : `.env.example` 🏞️🏞️

Si jamais vous voulez être gentil avec votre futur vous, vous pouvez créer un fichier `.env.example` qui est une copie de `.env`, mais sans les valeurs. Ainsi c'est plus rapide de savoir quelles tokens vous devez garder. 

```env
REST_COUNTRIES_API_KEY=
```

:::tip
C'est assez standard de devoir utiliser un token pour accéder à un service externe. Par contre, ce qui n'est pas standard, c'est de stocker le token sur le client (votre application). La bonne pratique serait de passer par un serveur (ex : .NET Core, SpringBoot, etc.) pour faire les requêtes, pour éviter que n'importe qui puisse récupérer le token et faire des requêtes en votre nom 🥸. La documentation de [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv#security) en fait d'ailleurs mention.
:::

## 


[DIO](https://pub.dev/packages/dio) est une bibliothèque Dart pour envoyer des requêtes HTTP. Vous créez un client `dio` et appelez directement ses méthodes `get`, `post`, etc.

## 3. Dépendance 🚬

Depuis le dossier de votre projet Flutter, ajoutez `dio` :

```bash
flutter pub add dio
```

## Envoyer une requête GET

Le projet [01-acces_simple](https://github.com/departement-info-cem/5N6-mobile-2/tree/main/code/http/01-acces_simple) appelle un service qui double un nombre.

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/http/01-acces_simple/lib/main.dart"
  startLine="30"
  endLine="45"
/>

`await` attend la réponse sans bloquer l'interface graphique. La réponse HTTP est un objet `Response`; son champ `data` contient le JSON déjà décodé par DIO.

## Gérer les erreurs

Une requête peut échouer parce que le réseau est indisponible, que le serveur répond avec une erreur ou que l'URL est invalide. Le projet intercepte cette erreur et informe l'utilisateur avec un `SnackBar`.

Utilisez les outils de développement de votre IDE et les journaux de débogage pour examiner l'URL, le code HTTP et le contenu de la réponse.
