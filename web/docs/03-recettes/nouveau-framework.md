# Apprivoiser un nouveau framework 💬

Si on compte C#, SQL, Bash, Batch, HTML, CSS, JavaScript, Kotlin, Java et TypeScript, Dart va être le 11e langage que vous allez apprendre, et Flutter est votre énième framework (.NET Core, React, Jetpack Compose). Vous commencez à avoir l'habitude de vous approprier de nouveaux langages. Il serait d'ailleurs surprenant que vous n'en appreniez pas d'autres à l'université ou dans votre vie professionnelle.

Voici quelques pense-bêtes à garder non loin de vous lorsque vous apprenez un nouveau langage ou framework.

## Conventions de nommage

Chaque langage possède ses propres standards pour les identifiants suivants :

- Variable
- Classe
- Modificateur pour indiquer si une classe est publique ou privée
- Fichier
- Dossier ou package

:::info
Parfois, les frameworks supplantent les standards de nommage du langage dans lequel ils sont écrits. Par exemple, en TypeScript, les noms des fichiers sont en **kebab-case** (ex : `mon-fichier.ts`), alors qu'en React, les fichiers de composants sont en **PascalCase** (ex : `MonFichier.tsx`).
:::

Il vous appartient de vous informer sur les conventions de nommage de chaque nouveau langage.

:::danger
C'est le genre de détail qui n'est pas particulièrement surveillé dans un contexte scolaire, mais qui l'est dans un contexte professionnel.
:::

## Structure du projet (L'arborescence)

Chaque framework a sa façon d'organiser les dossiers. Savoir où placer son code est la première étape pour s'y retrouver. Certains frameworks sont plus stricts que d'autres. Par exemple en MVC, les modèles, les vues et les contrôleurs ont leurs propres dossiers.

C'est aussi important de connaître le point d'entrée du code, là où les premières instructions sont exécutées. En C#, c'est habituellement `Program.cs`.

## Gestion des dépendances

Chaque langage possède habituellement un gestionnaire de dépendances qui permet d'obtenir des bibliothèques et des packages développés par la communauté ou par des entreprises. Voici ceux que vous avez vus jusqu'à présent :

- **C#** : NuGet, qui stocke les dépendances à installer dans un fichier `.csproj`.
- **JavaScript** (et TypeScript) : NPM, qui stocke les dépendances à installer dans un fichier `package.json`.

## Paradigme et concepts clés

Essayez de faire des liens avec les frameworks que vous connaissez déjà. Par exemple, demandez à un LLM : "Je connais déjà les frameworks React et Jetpack Compose et je souhaite apprendre Flutter. Quels sont les concepts des frameworks que je connais qui reviennent en Flutter, et quels sont ceux que je devrai apprendre ?".

## Outillage (CLI et Débogage)

Les frameworks offrent souvent des outils pour améliorer l'expérience de développement. Ces outils sauvent souvent beaucoup de temps quand vient le moment de déboguer une application.

Du code indenté est beaucoup plus agréable à lire pour vos camarades de classe ou vos collègues de bureau. Il faut toujours s'informer sur les outils pour formater le code sur votre éditeur de code de prédilection, et voir si le langage ou framework vous offre un formateur.
