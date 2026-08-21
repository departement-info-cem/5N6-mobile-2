# 🗃️ 5.1A – organisation

## Objectifs 🎯

Apprendre à structurer le code d'une interface complexe en extrayant des composants pour améliorer sa lisibilité et sa réutilisabilité.

## À faire 🛠️

1. **Le code de départ** : Téléchargez et ouvrez le projet suivant : [Code à organiser](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-organisation.zip).
2. **Le grand ménage** : La méthode `build` principale de ce projet est beaucoup trop longue. Vous devez la refactoriser en la découpant en plus petits morceaux logiques.
3. **Les exigences** : Votre refactorisation doit comporter au minimum :
   - Un **widget réutilisable** (nouvelle classe) pour afficher le menu latéral (`Drawer`).
   - Un **widget réutilisable** (nouvelle classe) pour afficher les informations d'un chat.
   - Une **méthode** pour générer la bannière du haut (ex: `Widget _buildBanner() { ... }`).
   - Une **méthode** pour générer la liste (ex: `Widget _buildListView() { ... }`).
