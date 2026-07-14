# Outils de débogage 🪲

Comme développeur, c'est toujours votre responsabilité de comprendre le code que vous produisez. Les outils ci-dessous vous permettront de vous approprier votre code et vous aideront à déboger vos applications Flutter.

## Le bon vieux point de debug

Dart supporte très bien les points de debug. Si vous demandez de l'aide à votre enseignant, que le problème est au niveau de l'exécution de l'application, c'est toujours attendu de commencer par regarder ce qui se retrouve dans les variables, ce qui permet souvent de comprendre pourquoi le fil d'exécution a emprunté un chemin plutôt qu'un autre.

## Flutter DevTools

Flutter offre une série d'outils pour vous aider à déboguer votre application. Pour y accéder, il faut que votre application Flutter s'exécute sur n'importe laquelle des plateformes supportées. Vous pouvez démarrer les outils des façons suivantes :

- **Visual Studio Code** : Si vous avez installé l'extension Flutter, des icônes sont disponibles dans la barre à gauche. Les principaux outils sont listés dans l'icône qui représente le logo de Flutter.
- **Ligne de commande** : Si vous avez démarré votre projet en ligne de commande avec `flutter run`, pendant que vous êtes dans le terminal. appuyez sur **v**.
- **Android Studio** : Si vous avez installé l'extension Flutter dans Android Studio, des icônes sont disponibles dans la barre à droite.

Nous allons nous concentrer sur Visual Studio Code puisque c'est l'outil qui est privilégié dans le cours, et qui est le mieux supporté par Flutter.

Nous n'aborderons pas tous les outils, mais nous vous encourageons à les explorer.

La [documentation officielle](https://docs.flutter.dev/tools/devtools) est aussi une excellente référence.

### Flutter Inspector

Vous permet de mieux comprendre le placement des différents widgets utilisés. Habituez-vous à vous y référer souvent, particulièrement dans les premières semaines de cours. 

![Flutter Inspector](https://docs.flutter.dev/assets/images/docs/tools/devtools/inspector_screenshot.png)

Vous devriez automatiquement vous y référer lorsque : 

- Vous voyez des barres jaune et noire dans votre application
- Un widget ne s'affiche pas alors qu'il est bel et bien créé
- Dans la console d'exécution, vous voyez des erreurs rouges qui ressemble à ça : 

```
════════ Exception caught by widgets library ═══════════════════════════════════
The following assertion was thrown while applying parent data.:
Incorrect use of ParentDataWidget.
```

L'option ![Selection Widget Mode](https://docs.flutter.dev/assets/images/docs/tools/devtools/select-widget-mode-button.png) vous permet soit de sélectionner le widget à visualiser dans l'inspector directement depuis votre émulateur, ou le contraire, sélectionner le widget dans l'inspector pour qu'il soit surligné dans l'émulateur.

### Network

C'est un peu comme l'onglet Network de votre inspecteur Chrome.

Network vous permet de voir les appels HTTP et leur réponse, et le détail de ce qui se retrouve dans le corps de l'envoie et de la réponse. 

![Network](https://docs.flutter.dev/assets/images/docs/tools/devtools/network_screenshot.png)

Vous pouvez habituellement ignorer les méthode `SOCKET`.