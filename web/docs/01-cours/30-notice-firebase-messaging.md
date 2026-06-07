# Notice de configuration pour Firebase Messaging

Le serveur KickMyB supporte déjà l'envoi de notifications. Par contre, il faut le configurer pour utiliser des clés secrètes fournies par votre projet Firebase.

## Générer la clé privée

- Dans votre projet Firebase, en haut à gauche, cliquez sur la roue dentée
- Choisissez l'option **Paramètres du projet**
- Allez dans l'onglet **Comptes de service**
- Dans la section **SDK Admin Firebase**, cliquez sur le bouton **Générer une nouvelle clé privée**
- Un fichier va se télécharger nommé `nom-de-votre-projet-adminsdk-quelque-chose.json`. Nous allons nous en servir à la prochaine étape.

## Ajouter la clé privée à votre projet KickMyB

- Dans votre **serveur** KickMyB, ajouter le fichier téléchargé à la racine
- Renommez le fichier pour qu'il ait exactement ce nom : `firebase-service-account-key.json`
- Démarrez le serveur
  - Si tout s'est bien passé, vous devriez voir le message "Firebase est bien configuré." dans les logs du serveur
  - S'il y a un problème, vous devriez voir le message "Firebase n'est pas configuré." dans les logs du serveur

:::danger Attention!!!
Cette clé privée (le fichier) permet à quiconque la possède d'intéragir avec votre application firebase en votre nom. Elle ne devrait jamais être rendue publique, et ne devrait idéalement pas se retrouver dans votre repo Git.

Nous vous recommandons de répéter cette marche à suivre à chaque fois que vous voulez tester les notifications.
:::
