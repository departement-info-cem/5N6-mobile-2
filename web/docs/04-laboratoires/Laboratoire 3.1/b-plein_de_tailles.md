# 🤏 3.1B – plein_de_tailles

## Objectif 🎯

Créer une interface adaptative (responsive) qui modifie radicalement sa structure en fonction de l'espace disponible, en combinant des calques et des effets visuels.

## À faire 🛠️

Créez une application affichant un formulaire de connexion ("Mes voyages - Connexion") accompagné d'une image de votre choix. L'interface doit s'adapter automatiquement selon l'espace disponible à l'écran :

1. **La détection** : Utilisez un `LayoutBuilder` pour basculer entre deux mises en page distinctes. Contrairement à d'autres méthodes qui vérifient l'inclinaison du téléphone, le `LayoutBuilder` prend des décisions basées sur les contraintes d'espace (ex: la largeur maximale `maxWidth` disponible). C'est la meilleure pratique pour gérer les différentes tailles d'écrans ! Fixez un point de bascule (breakpoint), par exemple à 600 pixels de large.
2. **Mode Étroit (L'empilement)** : Si l'espace est restreint (format portrait usuel), l'image de forêt doit prendre tout l'arrière-plan. Utilisez un widget `Stack` pour centrer la carte du formulaire par-dessus l'image. Appliquez un widget `BackdropFilter` pour rendre l'image de fond floue afin que le formulaire reste lisible.
3. **Mode Large (Côte à côte)** : Si l'espace est vaste (format paysage ou tablette), la disposition doit changer pour une vue horizontale. Placez le formulaire dans la moitié gauche de l'écran et l'image dans la moitié droite. Dans ce mode, l'image ne doit pas être floue.
4. **Validation** : Testez la robustesse de votre interface avec des tailles d'écran très différentes, spécifiquement sur les émulateurs **Pixel 10** (téléphone), **Pixel Fold** (téléphone pliable) et **Pixel Tablet** (tablette). Vous pouvez créer les Pixel Tablet et Pixel Fold dans Android Studio en utilisant l'option "Add Device" dans l'onglet "Device Manager".

<Row>

<Column size="4">

![Capture d'écran de l'application sur un écran étroit. L'arrière-plan est une photo d'un sentier forestier, mais celle-ci est recouverte d'un fort effet de flou. Au centre de l'écran, superposée par-dessus le fond flou, se trouve une carte blanche contenant un formulaire de connexion avec le titre 'Mes voyages - Connexion', des champs pour le nom et le mot de passe, et un bouton 'Poursuivre'.](_b-taille1.png)

</Column>

<Column size="8">

![Capture d'écran de l'application sur un écran large. Au centre d'un fond gris clair se trouve une très large carte blanche divisée en deux parties. La moitié gauche contient le même formulaire de connexion que précédemment. La moitié droite affiche la photo du sentier forestier, cette fois-ci parfaitement nette et sans aucun effet de flou.](_b-taille2.png)

</Column>

</Row>

