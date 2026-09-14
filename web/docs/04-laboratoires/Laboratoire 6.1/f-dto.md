# 🪪 6.1F – choix de DTO

## Objectif 🎯

Choisir les propriétés nécessaires d'une classe de transfert (DTO) à partir des informations réellement affichées dans une interface.

## À faire 🛠️

Pour chacun des deux cas suivants, définissez les propriétés que votre application devrait recevoir du serveur. Ne copiez pas automatiquement toutes les propriétés du modèle : un DTO ne contient que les données utiles à l'écran.

### Cas 1 - Profil de personne

Une application affiche le prénom, l'âge, une courte description, la ville et la photo de profil d'une personne. Elle ne doit pas recevoir son mot de passe, son courriel, son adresse complète ni ses informations administratives.

Créez un fichier `dto.md` dans votre dépôt d'exercices avec ce format :

```md
# PersonneDto
- id : int — nécessaire pour identifier le profil.
- prenom : String — affiché dans l'interface.
```

Ajoutez chaque propriété utile, son type Dart et une justification.

### Cas 2 - Compte et profil

Une application affiche le nom public, la photo et les centres d'intérêt associés à un compte. Le compte contient aussi des informations privées d'authentification et de facturation qui ne doivent jamais être envoyées au client pour cet écran.

Créez un fichier `dto2.md` avec le même format pour définir `CompteDto`. Indiquez les propriétés provenant du compte ou du profil qui sont nécessaires, ainsi que leur justification.

