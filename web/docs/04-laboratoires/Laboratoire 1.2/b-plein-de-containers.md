# 🍱 1.2B – plein_de_containers

## Objectif 🎯

Pratiquer :

- l'utilisation d'une vue défilante (`ListView`)
- la manipulation de l'espacement (Padding)
- l'optimisation de code (refactorisation).

## À faire 🛠️

<Row>
<Column size="6">

### Étape 1 : L'interface de base

Créez un écran qui affiche une liste défilante verticalement (utilisez un `ListView`). Cette liste doit contenir **10** `Container` empilés les uns sous les autres.

Chaque `Container` doit respecter les règles suivantes :

1. **Dimensions** : Occuper toute la largeur de l'écran et avoir une hauteur fixe de 200 pixels.
2. **Couleurs** : Chaque bloc doit afficher une nuance différente d'une même couleur (voir l'astuce ci-dessous).
3. **(Espacement (Padding))** : L'espacement qui entoure le `Container` doit augmenter progressivement. Le premier a un espacement de 0, le deuxième de 10, le troisième de 20, et ainsi de suite.
</Column>
<Column size="3"> 
![Résultat attendu au haut de l'application. Sur un fond blanc, on perçoit le début d'une liste verticale. Le premier bloc est vert très pâle et occupe toute la largeur de l'écran, illustrant un espacement (padding) de 0. Le deuxième bloc, juste en dessous, est d'un vert légèrement plus foncé et est entouré d'une petite marge blanche de tous les côtés. Le troisième bloc est encore plus foncé avec une marge blanche plus grande. Cette augmentation progressive de la marge donne l'impression que la largeur des blocs verts rétrécit au fur et à mesure de la descente.](_b-plein-de-containers-1.png)
</Column>
<Column size="3">
![Résultat attendu plus bas dans la liste, illustrant la progression de l'interface après un défilement. Les trois blocs visibles sont maintenant d'un vert nettement plus foncé. La marge blanche (padding) qui les entoure est devenue très importante, ce qui comprime considérablement les blocs verts au centre de l'écran. Cela confirme la logique mathématique de l'exercice : l'espacement continue de s'agrandir à chaque nouveau bloc, créant un effet visuel d'entonnoir.](_b-plein-de-containers-2.png)
</Column>
</Row>

:::info
Dans Flutter, les couleurs de la palette Material viennent avec des nuances numérotées, généralement de 50 (très pâle) à 900 (très foncé). Vous pouvez les utiliser avec des crochets :

```dart
Colors.green[0],  // Transparent
Colors.green[100] // Pâle
Colors.green[200] // Foncé
Colors.green[300] // Plus foncé
// Ainsi de suite jusqu'à 900
```
:::

### Étape 2 : L'optimisation (Bonus)

:::tip Bonus 1 : Limiter la duplication (Principe [DRY](http://fr.wikipedia.org/wiki/Ne_vous_r%C3%A9p%C3%A9tez_pas))
Si vous avez réalisé l'Étape 1 de façon "naïve", vous avez probablement copié-collé le même bloc de code 10 fois pour créer vos 10 conteneurs. Modifiez votre code pour extraire la création d'un conteneur dans une méthode ou un Widget réutilisable.

👉 Objectif : Ne plus avoir de code d'interface dupliqué. Validez votre solution avec votre enseignant.
:::

:::tip Bonus 2 : Génération dynamique (La boucle)
Même en ayant réussi le Bonus 1, vous avez probablement dû appeler votre nouvelle méthode 10 fois manuellement (une fois pour chaque conteneur). Modifiez votre approche pour utiliser une structure itérative (une boucle ou un constructeur spécifique du ListView).

👉 Objectif : Le code qui génère le conteneur ne doit être appelé qu'à un seul endroit dans tout votre fichier. Validez votre solution avec votre enseignant.
:::
