# Boîte à outils Visual Studio Code pour non-voyants 

## Raccourcis Généraux

### Accessibilité

- Alt + F1 : Obtenir l'aide d'accessibilité pour la fenêtre ouverte. Ça vaut la peine de l'essayer souvent, quitte à ce qu'on tombe encore sur le message d'accessibilité de base.
- Shift + Alt + F2 : Obtenir le texte d'une zone actuelle. Beaucoup plus facile consulter du contenu plus "visuel" avec un lecteur d'écran.

### Éditeur

- Ctrl + M : Activer ou désactiver le "Tab Trapping". Une fois que l'éditeur est dans ce mode, ça devient possible de naviguer d'une section de l'éditeur à l'autre à l'aide de Tab et Ctrl + Tab.
- Shift + Alt + Flèche droite : Permet d'étendre la sélection. Ex : si le curseur est dans un bloc if qui est dans une fonction qui est dans une classe, le premier Shift + Alt + Flèche droite sélectionne l'intérieur du if, le 2ième sélectionne le if au complet, le 3ième sélectionne le contenu de la fonction, ainsi de suite.
- Shift + Alt + Flèche gauche : Inverse de Shift + Alt + Flèche droite. Permet de réduire la sélection.

### Navigation

- Pour ouvrir un projet, utiliser la commande dans le terminal `code le-chemin-vers-votre-projet`, plutôt que d'ouvrir le projet directement dans Visual Studio Code.
- Ctrl + P : Chercher dans les noms de fichier pour ouvrir un fichier
- Ctrl + 1 ou Ctrl + 2 ou Ctrl + 3, etc pour focuser sur l'éditeur correspondant à l'index d'un onglet ouvert.
- Ctrl + Maj + O : Lister rapidement les symboles dans le fichier ouvert, et y naviguer au besoin
- F8 : Aller au prochain problème trouvé par l'éditeur de code
- Maj + F8 : Aller au précédent problème trouvé par l'éditeur de code
- F12 : Aller à la définition d'un symbole. Ex : lorsque le curseur est sur un appel de méthode, aller à l'endroit où la méthode est définie. Fonctionne aussi avec les variables, les classes, etc.

### Commandes

- Ctrl + Shift + P : Chercher dans les actions disponibles. Ex pour le cours : Créer un projet, etc.
- Ctrl + . : Liste les suggestions pour modifier du code
