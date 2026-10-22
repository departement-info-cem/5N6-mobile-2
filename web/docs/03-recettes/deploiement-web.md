# Déploiement web 🕸️

Si vous aviez oublié, Flutter est multiplateforme. Ce qui signifie que vous pouvez exécuter votre projet sur Android, mais aussi sur : web, iOS, Windows, MacOS, Windows.

Nous allons voir comment déployer votre projet sur le web.

:::caution Avant de commencer
Si vous avez utilisés des packages qui ne sont pas montrés dans le cours, c'est important de vérifier s'ils sont compatibles avec la plateforme web. C'est assez fréquent que certains soient uniquement disponibles sur mobile.
:::

:::info
Assurez vous d'avoir consulté [Déploiement Android 🤖](./deploiement-android.md) avant cette recette, puisqu'elle assume que certaines notions 
:::

## 1. Activer web

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

## 2. Déployer

Maintenant que votre application s'exécute en local, nous allons la déployer sur le web.

Pour y arriver, nous allons utiliser Cloudflare Pages, qui est un service d'hébergement de site web **statique** (ce qui signifie que vous ne pourriez pas héberger vos projets .NET, mais effectivement vos projets React), combiné avec GitHub Actions.

### 2.1 Créer votre compte Cloudflare

1. Ouvre le [tableau de bord Cloudflare](https://dash.cloudflare.com).
2. Créez un compte, si nécessaire. Vous pouvez réutiliser votre compte GitHub, par exemple.
3. Dans la recherche rapide en haut à droite, cherchez **Workers & Pages**.
4. Créez une application Pages en choisissant le mode **GitHub**.
5. Choisissez l'organisation ou le compte GitHub sur lequel votre repo se trouve.
6. Remplissez les options suivantes :
   - **Project name** : Nom de votre projet. Ex : montpetitami.
   - **Build command** : `flutter build web --release`. Attention! Si votre projet Flutter n'est pas à la racine de votre repo, il faut ajouter le chemin vers le dossier qui contient le repo à la fin de la commande fournie. Donc si votre projet Flutter se trouve dans le dossier `montpetitami`, dans votre repo, la commande ressemblera à `flutter build web --release montpetitami`
   - **Deploy command** : Laisser tel quel. `npx wrangler deploy`.
   - **Preview command** : Laisser tel quel. `npx wrangler preview`
   - Cliquer sur **Deploy**.