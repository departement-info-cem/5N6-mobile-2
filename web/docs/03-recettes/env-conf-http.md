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

### 2.2 `flutter_dotenv` 🐦🏞️

Le package [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv) va nous permettre d'utiliser les valeurs qui sont dans `.env` dans notre code.

Suivez les instructions sur la page du package pour compléter son installation. Un exemple est fourni pour utiliser la librairie.

:::danger Attention!
S'il n'y a aucune clé valeur dans votre fichier `.env`, le lancement de l'application va échouer.
:::

### 2.3 Bonus : `.env.example` 🏞️🏞️

Si jamais vous voulez être gentil avec votre futur vous, vous pouvez créer un fichier `.env.example` qui est une copie de `.env`, mais sans les valeurs. Ainsi c'est plus rapide de savoir quelles tokens vous devez garder. 

```env
REST_COUNTRIES_API_KEY=
```

:::tip
C'est assez standard de devoir utiliser un token pour accéder à un service externe. Par contre, ce qui n'est pas standard, c'est de stocker le token sur le client (votre application). La bonne pratique serait de passer par un serveur (ex : .NET Core, SpringBoot, etc.) pour faire les requêtes, pour éviter que n'importe qui puisse récupérer le token et faire des requêtes en votre nom 🥸. La documentation de [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv#security) en fait d'ailleurs mention.
:::

## 3. Configuration 🧑‍🔧

Maintenant que nous avons terminés de configurer l'environnement,nous sommes prêts à faire nos requêtes HTTP, non? Minute papillon 🦋!

Ça peut arriver que certaines informations soient réutilisées dans différents fichiers. Par exemple, l'URL vers un service externe. Supposons que l'URL du service externe change, c'est assez agaçant de devoir chercher chaque endroit dans le projet qui fait référence à cette URL pour les changer.

Autre cas intéressant : si vous développez un client (ex : React, Flutter) en même temps qu'un serveur REST (ex : .NET Core), comme sera le cas pendant le projet final, vous voudrez souvent vous connecter au serveur de développement local (ex : localhost) au serveur déployé sur internet (ex : monprojet.com). Encore là, c'est important de pouvoir modifier l'URL du serveur à un seul endroit.

La structure de fichiers que nous allons ajouter ressemble à celle-ci : 

```
lib/
└── config/
    └── app_config.dart

config/
└── dev.json
```

### 3.1 `config/dev.json` 👶

C'est ici que nous allons stocker les données. Ajoutez l'URL vers le point de terminaison de l'API.

```json
{
  "API_URL": "https://api.restcountries.com",
  "ENVIRONMENT": "dev"
}
```

Pour notre cas, nous avons tout ce dont nous avons besoin, mais nous pourrions ajouter d'autres fichiers json au même endroit pour ajouter d'autres configurations. Ex : `prod.json` qui contiendrait la même structure que `dev.json`, mais avec d'autres valeurs.

### 3.2 `lib/config/config.dart` 🎯

Notre code dart ne peut pas directement lire le contenu du fichier json. C'est pourquoi `config.dart` fait l'intermédiaire entre les deux.

```dart
class AppConfig {
  static const apiUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://api.restcountries.com',
  );

  static const environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'dev',
  );
}
```

Quand nous allons vouloir obtenir une de ces valeurs dans notre code dart, il faudra simplement faire comme suit, par exemple : 

```dart
final url = '${AppConfig.apiUrl}/countries/v5?q=peru&pretty=1';
```

## 4. HTTP

Bon finalement! Nous nous lançons!

[DIO](https://pub.dev/packages/dio) est une bibliothèque Dart pour envoyer des requêtes HTTP. Vous créez un client `dio` et appelez directement ses méthodes `get`, `post`, etc.

### 4.1 Dépendance 🚬

Depuis le dossier de votre projet Flutter, ajoutez `dio` :

```bash
flutter pub add dio
```

### 4.2 Ma première requête 🧑‍🍼

La première requête que nous allons voir n'est pas très propre 🫟. C'est surtout pour avoir rapidement un premier exemple fonctionnel. Nous allons ensuite nettoyer tout ça 🧹.

Dans votre interface graphique, créez un bouton qui appelle cette fonction :

```dart
class _HomePageState extends State<HomePage> {
  Future<void> monPetitAppel() async {
    final Dio dio = Dio();
    final Response<dynamic> response = await dio.get('https://google.ca');
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Jusqu'ici, la fonction n'a pas été appelée
            Future<void> monPetitAppelDuFutur = monPetitAppel();

            // Ok on exécute la fonction, l'appel HTTP est lancé!
            // On attend (await) d'obtenir une réponse avant de passer à la ligne suivante.
            await monPetitAppelDuFutur;

            // La façon plus propre de le faire serait simplement :
            // await monPetitAppel()
          },
          child: Text("OK GO!"),
        ),
      ),
    );
  }
}
```

:::note
Notez les mots clés `Future`, `async` et `await`. Ils sont utilisés lorque nous voulons créer et appeler des fonctions asynchrone (des fonctions dont on ne sais pas d'ici combien de temps la réponse va nous revenir).

`Future` est un peu l'équivalent de `Task` en C#, que vous avez probablement déjà vu dans vos cours de Web. Ça indique que ce qui est dans la fonction sera effectué éventuellement, par exemple lorsqu'un `await` sera utilisé avant l'appel de la fonction.
:::


## Gérer les erreurs

Une requête peut échouer parce que le réseau est indisponible, que le serveur répond avec une erreur ou que l'URL est invalide. Le projet intercepte cette erreur et informe l'utilisateur avec un `SnackBar`.

Utilisez les outils de développement de votre IDE et les journaux de débogage pour examiner l'URL, le code HTTP et le contenu de la réponse.
