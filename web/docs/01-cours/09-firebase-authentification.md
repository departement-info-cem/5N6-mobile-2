---
description: Connexion et création de compte
hide_table_of_contents: true
---

# Firebase : comptes et authentification 🔐

:::tip Avant la séance

Explorez d'abord le laboratoire **[⚙️ 5.1A – firebase_setup](../04-laboratoires/Laboratoire%205.1/a-firebase_setup.md)** pour configurer les bases de Firebase.

Ensuite, lisez la documentation de Firebase sur l'authentification **[ici](https://firebase.google.com/docs/auth/flutter/start)** en **20-30 minutes maximum**. L'important est de combiner lecture et expérimentation.

Suivez le laboratoire **[🔐 5.1B – firebase_auth_setup](../04-laboratoires/Laboratoire%205.1/b-firebase_auth_setup.md)** pour configurer Google Sign-In dans votre projet.

**Attention:** Les étapes de configuration Android doivent être répétées sur chaque nouveau poste de travail.

Nous ne voulons pas écrire directement sur les vrais serveurs de Firebase quand on est en développement. Nous allons donc utiliser la
suite d'émulateurs de firebase. Pour cela suivre le laboratoire **[🔐 5.1C – firebase_emulateurs](../04-laboratoires/Laboratoire%205.1/c-firebase_emu.md)**

Optionnel : Explorez l'authentification par mot de passe dans la **[documentation officielle](https://firebase.google.com/docs/auth/flutter/password-auth)**.

:::

:::info Séance

Nous discuterons du concept de **serverless** : ce n'est pas qu'il n'y a pas de serveur, c'est plutôt qu'on ne code pas le serveur explicitement.

Nous verrons le plan stratégique pour un premier projet Firebase + Flutter.

L'authentification d'un utilisateur ne nécessite pas forcément de créer un compte. Nous pouvons utiliser des comptes existants (Google, Facebook, etc.). Firebase unifie ces approches.

En combinant Firebase et Flutter, on obtient une application multi-plateforme gérant plusieurs types de comptes.

Nous explorerons les types d'authentification possibles avec Firebase:

- 🔓 Anonyme
- 📧 Courriel + code
- 👤 Comptes gérés (inscription, etc.)
- 🌐 Fournisseurs externes (Google, Facebook, etc.)

:::

:::note Exercices

Complétez les laboratoires dans l'ordre:

1. **[⚙️ A – firebase_setup](../04-laboratoires/Laboratoire%205.1/a-firebase_setup.md)** - Configuration de base
2. **[🔐 B – firebase_auth_setup](../04-laboratoires/Laboratoire%205.1/b-firebase_auth_setup.md)** - Authentification Google et par courriel
3. **[🔐 C – firebase_emulators](../04-laboratoires/Laboratoire%205.1/c-firebase_emu.md)** - Authentification Google et par courriel

Sinon, travaillez sur votre TP en intégrant l'authentification Firebase.

:::
