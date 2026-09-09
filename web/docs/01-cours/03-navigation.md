---
description: Passer d'une page à l'autre
hide_table_of_contents: true
---

# 2.1 - Navigation 🧭

:::tip Avant la séance

Lisez la documentation officielle [sur navigation et routing](https://docs.flutter.dev/ui/navigation). 

Flutter recommande 2 options pour la navigation : 

- [Navigator](https://api.flutter.dev/flutter/widgets/Navigator-class.html) (simple 🎃)
  - Navigation par pile simple
  - Impossible de gérer des urls
- [Router](https://pub.dev/packages/go_router) (avancé 🥨)
  - Gère les URL (ex : /user/profile)
  - Supporte le [Deep Linking](https://docs.flutter.dev/ui/navigation/deep-linking)
  - Gère les redirections

Pour les exercices et pour votre TP, vous aurez à choisir l'une de ces 2 options. 

Regardez le code du projet [navigation](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-navigation.zip) qui compare la navigation avec Navigator et celle avec Router. 

1. Exécutez l'application et regardez la suite de [TODO](../03-recettes/lancer-projet-fourni.md) **a**.
2. Changez la propriété `useNavigator` à `true` dans le fichier `app_config.dart` .
3. Réexécutez l'application et regardez la suite de [TODO](../03-recettes/lancer-projet-fourni.md) **b** en comparant avec les [TODO](../03-recettes/lancer-projet-fourni.md) **a**.

:::

:::info Séance

- On discutera du concept de pile de navigation et des opérations `push` et `pop`.
- On regardera les avantages et inconvénients des routes nommées ou pas dans un contexte mobile ou web.
- On discutera des avantages et des inconvénients de passer des objets complexes ou uniquement des identifiants entre les écrans de notre application.
- On regardera le comportement du Scaffold quand on ajoute un drawer.

Complétez les exercices suivants :

- [🛣️ 2.1A – simple_nav](../04-laboratoires/Laboratoire%202.1/a-simple_nav.md)
- [📋 2.1B – liste_nav_drawer](../04-laboratoires/Laboratoire%202.1/b-liste_nav_drawer.md)

:::
