# Déploiement Android 🤖

Développer une application Android, c'est une première étape; il faut ensuite la rendre disponible aux utilisateurs. Cette recette présente les principales façons de distribuer une application Android.

:::caution Limites
La publication d'une application sur [Google Play](https://play.google.com/) ou l'[App Store](https://apps.apple.com/) nécessite un compte de développeur et implique plusieurs étapes. Les comptes peuvent entraîner des frais. Cette recette s'arrête avant les étapes propres à la publication sur ces plateformes.
:::

Pour distribuer une application Android, on rencontre principalement deux formats : [.apk](https://fr.wikipedia.org/wiki/APK_(format_de_fichier)) et [.aab](https://fr.wikipedia.org/wiki/Android_App_Bundle).

Pour comprendre leur différence, il faut d'abord connaître quelques concepts.

Pour suivre cette recette, nous vous recommendons de télécharger [tape_le_lapin]((https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-tape_le_lapin.zip), et d'ouvrir le projet.

## ABI (Application Binary Interface)

Une ABI définit notamment la façon dont un programme compilé interagit avec le système et le processeur. Elle est liée à une architecture de processeur. Voici quelques exemples :

| ABI | Processeur | Où on le trouve |
|-----|------------|-----------------|
| `arm64-v8a` | ARM 64 bits | Presque tous les téléphones actuels, émulateurs sur Mac Apple Silicon |
| `armeabi-v7a` | ARM 32 bits | Vieux téléphones ou appareils d’entrée de gamme |
| `x86_64` | Intel/AMD 64 bits | Émulateurs sur PC, Chromebooks |

On peut dire que chaque processeur "parle" un language, et que le ABI est ce qui permet à votre application Android de "parler" ce language.

Une application doit généralement être exécutable sur l'ensemble de ces plateformes.

:::info
Les architectures de processeur et les ABI constituent un domaine à part entière. Nous ne survolons les notions utiles pour comprendre les formats de distribution.
:::

## APK

Un fichier `.apk`  est un format binaire compilé, installable, qui contient votre application. Toutes les applications sur un téléphone Android sont des APK.

Par exemple, c'est possible de demander à Flutter de générer un APK avec la commande `flutter build apk`. Vous retrouverez le APK dans `/build/app/outputs/apk/release/app-release.apk`. Vous pourriez ensuite donner ce fichier à un ami, et il serait en mesure d'installer votre application, sans avoir à passer par Google Play.

:::note À faire dans Tape le 🐇
Exécutez `flutter build apk`. La console va vous montrer où le fichier a été créé, et sa taille. Notez la taille dans un fichier texte.
:::

En fait, un APK est simplement un fichier zip, avec une structure bien précise.

:::tip Truc de hacker 👾
Prenez un fichier `.apk`, renommez l'extension `.apk` pour `.zip`, et vous serez capable d'extraire son contenu, par exemple avec l'extracteur de Windows, ou 7-Zip.

Vous devriez voir, entre autre, ces fichiers :

```text
app-release/
├── AndroidManifest.xml  // Même manifest qui se retrouve dans `/android/src/*/AndroidManifest.xml
├── assets/              // Fichiers bruts lus pendant l’exécution, surtout les assets Flutter
├── classes.dex          // Code Kotlin et Java compilé pour Android. C'est techniquement possible de le décompiler pour voir le code source qui est derrière!!!
├── kotlin               // Métadonnées du langage Kotlin
├── lib/                 // Code natif : le moteur Flutter et votre Dart compilé
├── META-INF             // Métadonnées sur les bibliothèques et le build
├── res                  // Ressources Android : icône, fond de démarrage
└── ressources.arsc      // Table qui associe chaque ressource à ses fichiers
```
:::

:::note À faire dans Tape le 🐇
Retrouvez le fichier `.apk` généré, faites en une copie sur votre bureau, renommez l'extension du fichier en `.zip`, et extrayez son contenu pour voir à quoi une application Android ressemble à l'intérieur.
:::

Le problème, c'est que quand ont compile avec `flutter build apk`, ça génère un APK qu'on dit universel. Un APK universel contient les instructions pour tous les ABI supportés par Android, énumérés plus haut. Ça fait beaucoup de gaspillage, puisque dans l'APK va toujours s'exécuter sur un seul ABI à la fois. Il contient donc toujours 1 ABI utile, et 2 qui sont complètement inutiles, illisibles par l'appareil Android sur lequel il s'exécute.

Vient la commande `flutter build apk --split-per-abi` qui permet de générer 3 APK différents, un par ABI. Si vous donnez à votre ami l'APK qui correspond à sa plateforme (proablement celui qui contient `arm64-v8a`), il sera encore en mesure d'installer l'APK sur son téléphone. Il ne remarquera aucun changement dans l'application, mais il aura économisé le tier de la taille! 

:::note À faire dans Tape le 🐇
Exécutez `flutter build apk --split-per-abi`. La console va vous montrer où les fichier ont été créés, et leurs tailles. Comparez la taille des 3 fichiers avec celle du premier APK généré. Il sont beaucoup plus petits. Si on additionne leurs tailles, on obtient un chiffre assez proche de celui du premier APK généré.
:::

## AAB (Android App Bundle)

Un fichier `.aab` (Android App Bundle) est un format de publication. C'est ce format de fichier qui est publié sur Google Play. Il regroupe les 3 APK générés plus haut, que des éléments qui sont identiques entre les 3 APK (ex : images, traductions, etc.). Lorsqu'un utilisateur veut télécharger votre application, il communique le ABI de son téléphone au Play Store, qui va lui donner le APK qui correspond à son ABI.
