# Configurations 🧑‍🔧

## C'est quoi une config?

C'est possible de vouloir faire en sorte l'application ait un comportement différent dépendemment de si elle s'exécute en développement vs lorsqu'elle s'exécute en production, sur l'appareil d'un utilisateur final.

Nous allons donc créer des fichiers de valeur qui vont être utilisées selon le contexte d'exécution. Ça permet aussi de centraliser ces informations qui sont suceptibles d'être modifiées dans le futur.

Par exemple, l'URL vers un service externe (ex : un web API). En développement, c'est généralement `localhost` ou `10.0.2.2` qui est utilisé, alors que lorsque l'application est déployée, c'est l'url (ex : https://api.montpetitami.quebec) qui est utilisé.

## Mise en place

La structure de fichiers que nous allons ajouter ressemble à celle-ci : 

```
lib/
└── config/
    ├── app_config.dart
    ├── config_factory.dart
    ├── dev_config.dart
    └── prod_config.dart
```

### 3.1 `lib/config/app_config.dart`

Nous allons créer une classe abstraite qui décrit l'ensemble des variables dans notre configuration. 

```dart
abstract class AppConfig {
  String get apiUrl;
  bool get isDev;
}
```

### 3.2 `lib/config/android_dev_config.dart`, `lib/config/prod_config.dart`, et toute autre configuration 

`AndroidDevConfig` implémente `AppConfig`, ce qui le force à fournir une définition pour toutes les valeurs de configuration. Qui aurait cru que les notions du cours de [Programmation orientée objet](https://info.cegepmontpetit.ca/2P6/cours/rencontre23) nous seraient utiles à nouveau!

```dart
class AndroidDevConfig implements AppConfig {
  @override
  String get apiUrl => 'http://10.0.2.2';

  @override
  bool get isDev => true;
}
```

On ferait la même chose avec `ProdConfig` qui implémenterait `AppConfig`, mais en spécifiant ses valeurs propres.

:::tip
C'est aussi possible de définir des fichiers pour lorsqu'on est en développement local, mais sur d'autres plateformes. Par exemple, c'est possible que le développement iOS et Android nécessitent des valeurs de développement différentes. On pourrait donc avoir un fichiers `dev_ios.dart` pour ce qui a trait à iOS.
:::

### 3.3 Choisir une configuration au démarrage

Pour que Flutter utilise une configuration en particulier au démarrage, il faut simplement lancer l'application avec l'option `--dart-define`, en spécifiant la configuration qui nous intéresse :

```bash
flutter run --dart-define=ENV=android_dev
```

Encore mieux : on peut modifier les configurations de lancement de Visual Studio Code pour pouvoir sélectionner la configuration qui nous intéresse à la volée.

1. Dans Visual Studio Code, aller dans l'onglet ![Ctrl+Maj+D](./_configuration/debug.png)
2. Sélectionner **créer un fichier launch.json**. Un fichier a été généré à `.vscode/launch.json`. Ouvrez le.
3. Chaque élément dans la liste json représente une configuration d'exécution qui a été créé par défaut. On peut ajouter 2 configurations modifiées, comme suit :

```json
{
    "name": "DEV",
    "request": "launch",
    "type": "dart",
    "args": [
        "--dart-define=ENV=android_dev"
    ]
},
{
    "name": "PROD",
    "request": "launch",
    "type": "dart",
    "args": [
        "--dart-define=ENV=prod"
    ]
},
```

Les 2 configurations sont maintenant disponibles dans l'onglet ![Ctrl+Maj+D](./_configuration/debug.png).

### 3.4 `lib/config/config_factory.dart`

Il ne reste qu'à faire le lien entre les fichiers de configurations et la valeur qui a été choisie avec `--dart-define`.

```dart
class ConfigFactory {
  static AppConfig create() {
    const environment = String.fromEnvironment(
      'ENV',
      defaultValue: 'android_dev', // Valeur par défaut si jamais rien n'a été spécifié
    );

    return switch (environment) {
      'android_dev' => AndroidDevConfig(),
      'prod' => ProdConfig(),
      _ => throw Exception(
          'Environnement inconnu : $environment',
        ),
    };
  }
}
```

### 3.5 Utiliser les variables de configuration

Les variables sont maintenant disponibles via `ConfigFactory.create()`.

```dart
final AppConfig config = ConfigFactory.create();
```

### Le mot de la fin

Un projet de référence de ce qui a été démontré dans cette recette est disponible [ici](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-configuration_demo.zip).
