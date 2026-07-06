---
hide_table_of_contents: false
---

# Supprimer les tâches

Dans ces 2 périodes, vous allez implanter la suppression de tâches dans l'application ... par équipe de 2 (3 s'il reste un tout seul).

Ce qu'on va y gagner:

- une initiation à Spring Boot
- une pratique d'un mini Sprint sur du Java backend
- une réflexion sur la suppression et la "suppression" de données
- l'utilisation de Github, des Issues pour planifier vos tâches

:::danger Attention!
VOUS DEVEZ FAIRE LE TOUT PENDANT LES 6 HEURES DE COURS EN CLASSE.
UTILISER LE TEMPS DE TRAVAIL A LA MAISON POUR COMPLETER VOTRE TP2
:::

## Étape 0 : Discussion sur "soft delete" et "hard delete"

Chaque équipe doit décider entre les 2 approches:

- **soft delete** : les tâches restent dans la BD, chaque tâche se retrouve avec un booléen actif ou non et l'application va juste toujours renvoyer seulement les actifs
- **hard delete** : la tâche est réellement supprimée de la base de données. Pouf ... disparue

Quelques questions pour partir la conversation:

1. Est-ce qu'en tant qu'utilisateur, si vous supprimez une tâche vous êtes ok que l'entreprise la conserve? Imaginez une tâche avec une description sensible, un truc très personnel ou même avec un mot de passe dedans.
2. Selon vous est-ce que c'est légal?
3. Techniquement, qu'est-ce qui vous semble le plus simple? Niveau BD, service, DTO et client?

## Étape 1 : Fork du projet et ajout du ou des coéquipiers

1. Aller sur le repo du serveur : [https://github.com/departement-info-cem/KickMyB-Server](https://github.com/departement-info-cem/KickMyB-Server)
2. Un des équipiers forke le projet dans son compte : [https://docs.github.com/fr/get-started/quickstart/fork-a-repo](https://docs.github.com/fr/get-started/quickstart/fork-a-repo)
3. Il ajoute son co-équipier comme contributor au repo : [https://docs.github.com/en/issues/planning-and-tracking-with-projects/managing-your-project/managing-access-to-your-projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/managing-your-project/managing-access-to-your-projects)

## Étape 2 : planification du sprint / découpage en tâches

L'ajout de la suppression va demander de faire des modifications aux niveaux suivants:

- Serveur BD : comprendre comment la BD fonctionne et comment soit supprimer soit mettre à jour en ayant changé le status actif
- Serveur Service :
  - ajouter au moins une méthode de service pour la suppression
  - voir si les autres doivent être modifiées
  - Tester la méthode de service
- Serveur Controller :
  - ajouter le point d'entrée pour la suppression, choisir l'URL, besoin de classes de transfert nouvelles (DTO)
  - voir si les autres <strong>"/api/\*\*"</strong> doivent être modifiés
- **INDIVIDUEL** : Client Réseau : ajouter au moins le nouvel appel pour suppression et modification si nécessaire
- **INDIVIDUEL** : Client Interface : ajouter la possibilité de suppression une tâche quelque part dans l'application

Chaque équipe va découper en tâches. **VALIDEZ VOS TÂCHES AVEC LE PROF**

:::caution Attention!

Pour tester le tout, vous devrez soit utiliser Postman, soit l'intégrer à votre TP2.

Si vous intégrez dans le TP2, vous devrez le faire chacun sur le vôtre.

Vous ne pouvez pas partager le code de votre TP entre vous.

:::

## Étape 3 : le sprint / coder sans se marcher sur les pieds

Vous devez essayer de maximiser votre capacité à travailler en parallèle pour ne pas perdre de temps. Voici quelques stratégies:

- Commence en écrivant les noms des méthodes mais sans le code dans un commit fait avec tout les membres de l'équipe :
  - Quel sera le nom de la méthode dans la BD
  - le nom de la méthode dans le service
  - le nom de la méthode controller avec l'URL et la méthode
  - etc.
- Contrôleur : je peux implanter un point d'entrée, valider son comportement avec POSTMAN, est-ce qu'il se déclenche, commenter l'appel à la méthode de service mais vérifier le reste
- BD : je peux implanter le code mais je n'ai rien pour le déclencher .... FAUX, tu peux utiliser un test unitaire pour rapidement créer ton repo et voir si ton code fonctionne.
- Service : je peux tester la logique de ma fonction avec un mock de la BD

Pour chaque tâche, faites un code review à 2 pour valider quand c'est complété. Si le prof est dispo n'hésitez pas.

Ne négligez pas le test de votre code. Quand vous nous dites que c'est fini, ça signifie que vous pensez que ça part en production.

## Étape 4 : revue / validation

Appelez le prof pour votre revue:

1. Commencer par une démo de la suppression. Essayez de penser à un court scenario qui démontre la suppression. Les différents cas, si j'essaie de supprimer un truc qui n'existe pas, un truc qui n'est pas à moi.
2. Vous pouvez faire toute la présentation soit avec Postman soit avec votre TP2 modifié
3. Revue de code avec le prof. On va s'asseoir tous ensemble pour revoir le tout.

## Annexe appels de base / Postman

```json title="POST /api/id/signup"
{
  "username": "MrPipo",
  "password": "pipo"
}
```

```json title="POST /api/id/signin"
{
  "username": "MrPipo",
  "password": "pipo"
}
```

```json title="POST /api/add"
{
  "name": "test",
  "deadline": "2069-05-24T12:12:12"
}
```

```json title="GET /api/home"

```
