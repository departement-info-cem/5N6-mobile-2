---
description: Connexion et création de compte
hide_table_of_contents: true
---

# Firebase : comptes et authentification

<Row>

<Column>

:::tip Avant la séance :

### Étape 1 - Ajouter l'authentification

Regardez la doc de [firebase authentification](https://firebase.google.com/docs/auth/flutter/start). Nous vous recommandons d'y passer un maximum de 20 minutes. Il faut lire un peu, coder puis relire en profondeur que de lire de la doc 4 heures sans coder.

Dans le projet, nous allons utiliser la connexion avec des comptes Google. On va suivre les indications **[ici (Firebase Authentification)](notice-firebase-auth)**

ATTENTION, les étapes **[spécifiques à Android](notice-firebase-auth#configuration-google_sign_in-pour-android)** sont à répéter pour chaque nouveau poste de travail.

### Étape 2 - Ajouter l'authentification par mot de passe

L'authentification par mot de passe est très similaire à l'authentification par par google_sign_in, vous pouvez regarder la **[documentation officielle](https://firebase.google.com/docs/auth/flutter/password-auth)**

:::

</Column>

<Column>

:::info Séance

On discutera de ce que veut dire serverless. C'est pas vraiment qu'il n'y a pas de serveur. C'est plutôt qu'on ne code pas le serveur explicitement.

On discutera du plan de match pour mon premier projet en firebase + flutter.

Authentifier un utilisateur ne nécessite pas forcément de lui demander de créer un compte. On peut utiliser des comptes existants sur Google, Facebook etc.

Firebase Auth cherche à rendre facile ces différentes options en unifiant l'authentification le plus possible. En combinant avec Flutter qui unifie le dev ios et android, on peut obtenir une appli multi-plateforme qui gère une multitude de comptes possibles

Nous allons passer à travers l'ensemble des types d'auth possibles avec firebase

- anonyme
- courriel + code
- compte gérés : avec inscription et tout
- facebook, google etc

:::

</Column>

</Row>

:::note Exercices
Pas d'exercices, travaillez sur votre TP.
:::
