---
title: Règles d'accès Firebase et audit de sécurité
---

# 12.1A - Application Firebase et audit de sécurité

## Objectifs

Le but est d'utiliser un assistant IA pour vous aider à identifier des failles
dans votre application. 

Le plus courant, ce sont des failles de contrôle d'accès mais pas uniquement.

## Avant de commencer

Vous devez avoir un projet Firebase avec Authentication, Firestore et Cloud
Storage activés. Chaque compte utilisé pour les tests doit être identifiable
par son UID Firebase. En particulier:
- valider que vous avez une fichier `firebase.json` à la racine de votre projet;
- valider que vous avez un fichier `firestore.rules` à la racine de votre projet;
- valider que vous avez un fichier `storage.rules` à la racine de votre projet.

Avant de commencer assurez vous aussi que ses règles sont les mêmes dans la console web
de firebase.


### Installer GitHub Copilot CLI


```powershell
npm install -g @github/copilot
```

Utilisez `/login` si l'outil vous le demande.
Vous devez disposer d'un abonnement GitHub Copilot actif (celui du collège).

## Le laboratoire

On veut itérer sur le projet pour éliminer les failles de sécurité.

Pour commencer, il vaut mieux pour ce genre d'analyse utiliser les modèles d'IA appropriés:
- pour lister les modèles depuis copilot CLI taper la commandes /model
- un modèle de pointe est meilleur pour analyser le code
- par contre, les modèles les plus pointus refusent souvent de monter un exploit sur une faille

### Point de départ

Commencez en choisissant le modèle qui vous semble le plus avancé et demandez quelque chose ressemblant à:
```text
J'ai un projet Flutter Firebase) je cherche des failles, des correctifs potentiels, si tu le peux 
des exploits. Je ne veux pas de modification mais les éventuels problèmes trouvés par ordre
de danger.
```

Pour le reste de la séance (ou de vos crédits), essayez de renforcer la sécurité de votre application.
