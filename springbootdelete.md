# Supprimer les tâches

Dans ces 2 périodes, vous allez implanter la suppression de tâches dans l'application ... par équipe de 2 (3 s'il reste un tout seul). 

Ce qu'on va y gagner:
- une initiation à Spring Boot
- une pratique d'un mini Spring
- une réflexion sur la suppression et la "suppression" de données
- l'utilisation de Github, des Issues pour planifier vos tâches

## Etape 0 : Fork du projet et ajout du ou des coéquipiers

1. Aller sur le repo du serveur ::: https://github.com/departement-info-cem/KickMyB-Server
2. Un des équipiers forke le projet dans son compte  ::: https://docs.github.com/fr/get-started/quickstart/fork-a-repo
3. Il ajoute son co-équipier comme contributor au repo ::: https://docs.github.com/en/issues/planning-and-tracking-with-projects/managing-your-project/managing-access-to-your-projects

## Etape 1 : discussion sur "soft delete" et "hard delete"

Chaque équipe doit décider entre les 2 approches:
- soft delete : les tâches restent dans la BD, chaque tâche se retrouve avec un booléen actif ou non et l'application va juste toujours renvoyer seulement les actifs



## Etape 2 : planification du sprint / découpage en tâches

L'ajout de la suppression va demander de faire des modifications aux niveaux suivants:
- Serveur BD : comprendre comment la BD fonctionne et comment soit supprimer soit mettre à jour en ayant changé le status actif
- Serveur Service :
  - ajouter au moins une méthode de service pour la suppression
  - voir si les autres doivent être modifiées
- Serveur Controller :
  - ajouter le point d'entrée pour la suppression, choisir l'URL, besoin de classes de transfert nouvelles (DTO)
  - voir si les autres "/api/**" doivent être modifiés
- Client Réseau : ajouter au moins le nouvel appel pour suppression et modification si nécessaire
- Client Interface : ajouter la possibilité de suppression une tâche quelque part dans l'application

Chaque équipe va découper en tâches. VALIDEZ VOS TACHES AVEC LE PROF

PROBLEME IL VA FALLOIR QU ILS PARTAGENT UN DE LEURS TPS 2 ensemble PLAGIAT? OU ALORS ON FAIT JUSTE LE SERVEUR EN EQUIPE

## Etape 3 : le sprint / coder sans se marcher sur les pieds

Vous devez essayer de maximiser votre capacité à travailler en parallèle pour ne pas perdre de temps. Voici quelques stratégies:
- Commence en écrivant les noms des méthodes mais sans le code dans un commit fait à 2 :
  - Quel sera le nom de la méthode dans la BD
  - le nom de la méthode dans le service
  - le nom de la méthode controller avec l'URL et la méthode
  - etc.
- Controller: je peux implanter un point d'entrée, valider son comportement avec POSTMAN, est-ce qu'il se déclenche, commenter l'appel à la méthode de service mais vérifier le reste
- BD: je peux implanter le code mais je n'ai rien pour le déclencher .... FAUX, tu peux utiliser un test unitaire pour rapidement créer ton repo et voir si ton code fonctionne.
- Service : TODO

Pour chaque tâche, faites un code review à 2 pour valider 
