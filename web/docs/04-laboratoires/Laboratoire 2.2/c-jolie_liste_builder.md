# 🏗️ 2.2C – jolie_liste_builder

## Objectif 🎯

Optimiser l'affichage d'une longue liste en remplaçant une génération statique par un constructeur dynamique (`ListView.builder`).

## jolie_liste_builder

1. **Le point de départ** : Reprenez la logique de calcul (les 75 premiers nombres de Fibonacci) et la mise en forme visuelle (le style des cartes) développées dans l'exercice précédent (2.2B).
2. **La refactorisation** : Au lieu d'utiliser la fonction .map() pour générer tous vos widgets d'un coup, remplacez votre implémentation par le widget ListView.builder.
3. **Le résultat** : Visuellement, l'application doit être exactement identique à l'exercice 2.2B. La différence se trouve uniquement sous le capot de votre code !

:::info Pourquoi c'est mieux comme ça?
La fonction `.map()` construit tous les éléments de la liste instantanément, même ceux qui ne sont pas visibles à l'écran. Cela consomme inutilement de la mémoire. À l'inverse, `ListView.builder` instancie les éléments "à la volée", uniquement au moment où ils apparaissent à l'écran lors du défilement. C'est la méthode recommandée pour les longues listes !
:::