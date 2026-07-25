# 🤔 1.2C –  pas_si_simple

## Objectif 🎯

Pratiquer l'imbrication complexe de widgets (`Row` et `Column`), la gestion des proportions à l'écran, et l'utilisation de l'espacement dynamique pour repousser des éléments.

<Row>

<Column size="8">
## Mise en page

Créez une application dont l'interface doit respecter les contraintes structurelles suivantes :

- **Le bloc rouge (à gauche)** : Il doit avoir une hauteur fixe de 200 pixels et occuper exactement les 2/3 de la largeur de l'écran.
- **La section de droite** : Le 1/3 de largeur restant doit contenir le texte "YO" (en rouge) et un carré noir, empilés l'un en dessous de l'autre.
- **Le bouton du bas** : Un large bouton bleu indiquant "Bouton du bas" doit être repoussé complètement à l'extrémité inférieure de l'écran, peu importe la hauteur de l'appareil utilisé.

:::info 💡 Astuces de mise en page

- **L'arborescence** : Vous allez devoir imbriquer plusieurs widgets de disposition. Pensez à votre interface sous forme de boîtes : vous aurez fort probablement des `Row` dans des `Column`, eux-mêmes dans d'autres `Row` ou `Column`.
- **Les proportions** : Pour diviser l'écran en 2/3 et 1/3, explorez la propriété `flex` du widget `Expanded`.
- **L'espacement** : Pour pousser le bouton tout en bas, vous devez dire à Flutter qu'un élément invisible doit prendre "tout l'espace vide restant" au centre de l'écran. Le widget `Spacer` est parfait pour ce travail.
:::
</Column>
<Column size="4">
![Application mobile dont l'écran est organisé avec des éléments collés au sommet et à la base de l'écran. Dans la partie supérieure, l'espace est divisé horizontalement : à gauche, un grand rectangle rouge occupe les deux tiers de la largeur de l'écran. À sa droite, dans le tiers restant, on trouve le texte 'YO' empilé au-dessus d'un carré noir. Le grand espace central de l'écran est entièrement vide, ce qui a pour effet de repousser un large bouton bleu nommé 'Bouton du bas' à l'extrémité inférieure de l'interface, juste au-dessus de la bordure du téléphone.](./_c-pas_si_simple.png)
</Column>



</Row>