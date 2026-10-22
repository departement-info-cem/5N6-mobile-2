# Déploiement Android 🤖

Développer une application Android, c'est une première étape; il faut ensuite la rendre disponible aux utilisateurs. Cette recette présente les principales façons de distribuer une application Android.

:::caution Limites
La publication d'une application sur [Google Play](https://play.google.com/) ou l'[App Store](https://apps.apple.com/) nécessite un compte de développeur et implique plusieurs étapes. Les comptes peuvent entraîner des frais. Cette recette s'arrête avant les étapes propres à la publication sur ces plateformes.
:::

Pour distribuer une application Android, on rencontre principalement deux formats : [.apk](https://fr.wikipedia.org/wiki/APK_(format_de_fichier)) et [.aab](https://fr.wikipedia.org/wiki/Android_App_Bundle).

Pour comprendre leur différence, il faut d'abord connaître quelques concepts.

Pour suivre cette recette, il est recommendé de télécharger [tape_le_lapin](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-tape_le_lapin.zip), et d'ouvrir le projet.

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
├── assets/              // Fichiers bruts lus pendant l’exécution, surtout les assets Flutter (ex : images)
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

## Configurer le déploiement

Avec GitHub Actions, nous allons automatiser la production d'`apk` compilé à chaque release sur GitHub.

:::info C'est quoi ça une release?
Une release, c'est un commit en particulier que l'équipe de développement comme étant une version officielle du logiciel développé. Par exemple, voici les [releases de Docusaurus](https://github.com/facebook/docusaurus/releases), qui est la plateforme utilisée pour les sites web de cours utilisés au département.

C'est généralement utilisé par les gros projets open source pour documenter chaque sortie. On y retrouve généralement :

- Un numéro de version. Ex : `1.0.1`
- Une liste des changements depuis la dernière version
- La liste des fichiers liés à la release
:::

Créez un fichier à cet endroit `.github/workflows/android-release.yml`, et ajoutez-y ce contenu :

```yaml
name: Android Release
on:
  release:
    types: [published]

env:
  APP_DIR: .        # Si ton projet Flutter est dans un sous-dossier, mets son nom ici (ex. APP_DIR: montpetitami)

jobs:
  apk:
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: ${{ env.APP_DIR }}
    timeout-minutes: 20
    permissions:
      contents: write
    steps:
      - uses: actions/checkout@v5
      - uses: actions/setup-java@v5
        with: { distribution: temurin, java-version: 21 }
      - uses: subosito/flutter-action@v2
        with: { channel: stable, cache: true }
      - run: flutter build apk --release --build-name=${GITHUB_REF_NAME#v} --build-number=${{ github.run_number }}
      - name: Attacher l'APK à la release
        env:
          GH_TOKEN: ${{ github.token }}
        run: |
          APK="${{ github.event.repository.name }}-${GITHUB_REF_NAME}.apk"
          cp build/app/outputs/flutter-apk/app-release.apk "$APK"
          gh release upload "$GITHUB_REF_NAME" "$APK" --clobber
```

On pourrait faire un cours complet de 45h sur l'automatisation de tâche et sur les GitHub Actions. Nous ne rentrerons pas dans le détail, mais juste en lisant rapidement le code, vous devriez être en mesure de comprendre globalement ce qui se passe.


:::warning Avant d'aller plus loin
Dans le premier laboratoire, nous vous sensibilisons au fait de publier des clés secrètes dans du code client (ex : `.apk`, mais aussi un site web statique).

Avant de poursuivre, assurez vous de ne pas avoir de clés secrètes dans votre code. Si c'est le cas, appelez votre enseignant pour discuter avec lui de ce qui peut être fait. Certaines clés d'API peuvent être publiées en toute sécurité. C'est notemment le cas pour les clés liées à Firebase.

Les conséquence peuvent aller d'une limite d'API consommée par quelqu'un sur internet, jusqu'à des données secrètes de production qui se retrouvent accessibles à tous. C'est sérieux!
:::

## Créer une release

Avec cette configuration, chaque release que nous allons créer, produira un `.apk` qui s'associera à la release.

1. Naviguez vers la page principale de votre repo sur GitHub.
2. Dans la section à droite, vous trouverez une section nommée **Release**.
3. Cliquez sur **Create a new release**.
4. Remplissez les différents champs
    - **Tag** : créez un tag qui respecte les règles de la [gestion sémantique de version](https://semver.org/lang/fr/)
    - **Target** : restez sur `main`.
    - **Release title** : Trouvez un titre clair. Souvent le nom de la release reprende simplement le nom de la version. Exemple avec les releases de [Immich](https://github.com/immich-app/immich/releases).
    - **Release note** : Devrait décrire les changements depuis la dernère release. Ex : Ajouts, retraits, modifications, fix, bug, etc. Une release initiale est généralement plus exhaustive.
    - Pas besoin d'ajouter des fichiers binaires
5. Cliquez sur **Publish release** en bas de la page, ce qui va déclencher la génération automatisée du `.apk`. Ça peut peut prendre jusqu'à une dizaine de minutes. Vous pouvez surveiller le progrès dans la section **Actions** de votre repo.

## Déploiement web 🕸️

Si vous aviez oublié, Flutter est multiplateforme. Ce qui signifie que vous pouvez exécuter votre projet sur Android, mais aussi sur : web, iOS, Windows, MacOS, Windows.

Nous allons voir comment déployer votre projet sur le web.

:::caution Avant de commencer
Si vous avez utilisés des packages qui ne sont pas montrés dans le cours, c'est important de vérifier s'ils sont compatibles avec la plateforme web. C'est assez fréquent que certains soient uniquement disponibles sur mobile.
:::

### Activer

À la création de votre projet, vous aviez à spécifier quelles plateforme votre application devait supporter. Il est possible que vous ayez coché uniquement android.

Pour vérifier, regarder s'il existe un répertoire `web` à la racine de votre projet. Il devrait contenir quelques fichiers et dossier, notemment `index.html`.

Si le répertoire n'existe pas, ou s'il ne contient pas `index.html` :

1. Supprimez le dossier (s'il existait)
2. Exécutez la commande `flutter create --platforms=web .` (Important de spécifier le point à la fin)
3. Le dossier `web` devrait être créé avec quelques dossiers et fichiers dedans.
4. Listez les appareils disponibles avec `flutter devices`. Vous devriez voir les navigateurs installés sur votre poste.
5. Exécutez en mode web, avec `flutter run -d chrome`, ou en sélectionnant votre navigateur dans l'interface de l'extension Flutter.
6. Si après quelques secondes, votre application apparait dans une fenêtre de navigateur, faites un COMMIT + PUSH.

:::danger
Essayez de jouer avec le dimensionnement de la fenêtre web. Vous allez probablement voir que votre application est moins résiliente au changement de taille que ce que vous ne le pensez.
:::

### Configuration dans GitHub

Quelques paramètres à activer dans votre repo puisque l'hébergement se fait chez GitHub.

1. Naviguez vers **Settings** de votre repo
2. Naviguez vers l'onglet **Pages** 
3. Sous **Build and deployment** > **Source**, sélectionnez **GitHub Actions** plutôt que **Deploy from a branch**
4. Si la section **GitHub Pages visibility** > **Control who can view and access your site** apparait, sélectionnez **Private** si vous utilisez des clés d'API qui ne doivent pas être publiques, et **Public** si vous n'utilisez rien de sensible.
5. Naviguez dans l'onglet **Environments**, puis sélectionnez **github-pages**
6. Sous **Deployment branches and tags**, cliquez sur **Add deployment branch or tag rule**
7. Sélectionnez **Tag** comme **ref type** et `*` comme **Name pattern**
8. Cliquez sur **Add rule** 
9. Dans le code de votre projet, dans `web/index.html`, ajoutez l'attribut `crossorigin="use-credentials"` à la balise `<link rel="manifest" href="manifest.json">`


Il faut créer un nouveau fichier github actions, ou modifier le fichier plus haut pour y ajouter web à la section jobs.

`.github/workflows/web-release.yml` :

```yaml
name: Web Release
on:
  release:
    types: [published]

env:
  APP_DIR: .        # Si ton projet Flutter est dans un sous-dossier, mets son nom ici (ex. APP_DIR: montpetitami)

jobs:
  web:
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: ${{ env.APP_DIR }}
    timeout-minutes: 15
    permissions:
      pages: write
      contents: read
      id-token: write
    environment:
      name: github-pages
      url: ${{ steps.deploy.outputs.page_url }}
    steps:
      - uses: actions/checkout@v5
      - uses: subosito/flutter-action@v2
        with: { channel: stable, cache: true }
      - run: flutter build web --release --base-href "/${{ github.event.repository.name }}/"
      - uses: actions/upload-pages-artifact@v4
        with: 
          path: ${{ env.APP_DIR }}/build/web
      - id: deploy
        uses: actions/deploy-pages@v4
```

:::warning
C'est possible que le déploiement web ne fonctionne pas si votre enseignant utilise une organisation GitHub sans avoir activé le mode Teams qui est gratuit s'il est [enregistré comme enseignant chez GitHub](https://education.github.com/globalcampus/teacher).
:::