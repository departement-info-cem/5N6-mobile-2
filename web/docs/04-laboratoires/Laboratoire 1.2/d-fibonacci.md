# 🐌 1.2D –  fibonacci

🚨 Attention : Cet exercice s'est déjà retrouvé dans un examen pratique.

## Objectif 🎯

Approfondir votre compréhension de l'imbrication des widgets `Row` et `Column`, et maîtriser la répartition proportionnelle de l'espace grâce à la propriété `flex` du widget `Expanded`.



<Row size="8">
<Column>
## Fibonacci

Reproduisez la mise en page illustrée dans l'image de référence, qui s'inspire de la célèbre suite mathématique de Fibonacci.

Règles de l'exercice :

- **Les couleurs** : Elles n'ont aucune importance. Utilisez les couleurs de votre choix pour différencier les blocs.
- **Les chiffres** : Ils représentent les ratios (proportions) de chaque bloc par rapport aux autres. Vous n'avez pas besoin d'afficher ces chiffres en texte dans votre application, ils ne sont là que pour vous guider.
- **L'espace** : L'ensemble de la composition doit occuper la totalité de l'écran.

:::info Stratégie de l'oignon 🧅

Analysez l'image en la découpant du plus grand au plus petit. L'écran principal est une `Column` divisée en deux gros morceaux (le rouge en haut, et tout le reste en bas). Ensuite, "tout le reste en bas" est une Row divisée en deux morceaux (le vert à gauche, et tout le reste à droite), et ainsi de suite !
:::

</Column>
<Column size="4">
![Application divisée en plusieurs rectangles de couleurs différentes, illustrant une spirale de Fibonacci grâce à des ratios d'espace. 
L'écran est d'abord divisé verticalement (Column) : En haut, un grand rectangle rouge occupe une proportion de 21. En bas, un bloc occupant une proportion de 13 contient le reste de l'interface. Ce bloc du bas est divisé horizontalement (Row) : À gauche, un rectangle vert occupe une proportion de 13. À droite, un bloc avec une proportion de 8 contient le reste. Ce nouveau bloc à droite est divisé verticalement (Column) : En bas, un rectangle jaune occupe une proportion de 8. En haut, un bloc avec une proportion de 5 contient le reste. Ce bloc en haut est divisé horizontalement (Row) : À droite, un rectangle violet occupe une proportion de 5. À gauche, un rectangle bleu final occupe une proportion de 3.](./_d-fibonacci.png)
</Column>
</Row>