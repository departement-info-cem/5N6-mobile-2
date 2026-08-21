# 🤏 3.2B – redimensionnement

## Objectifs 🎯

Constater l'impact direct de la résolution d'une image téléchargée sur les temps de chargement et la consommation de mémoire de l'appareil.

## À faire 🛠️

Créez une application comprenant une navigation vers trois pages distinctes (via un menu, des onglets ou de simples boutons). Chacune de ces pages aura pour unique but d'afficher une image provenant du service picsum.photos, mais à des résolutions très différentes :

1. **Page 1 (Basse résolution)** : Affichez l'image à partir de l'URL [https://picsum.photos/200](https://picsum.photos/200).
2. **Page 2 (Haute résolution)** : Affichez l'image à partir de l'URL [https://picsum.photos/5000](https://picsum.photos/5000).
3. **Page 3 (Résolution ajustée)** : Affichez l'image en résolution ajustée à la largeur del'écran : [https://picsum.photos/largeur-ici](https://picsum.photos/largeur-ici), en utilisant un [LayoutBuilder](https://api.flutter.dev/flutter/widgets/LayoutBuilder-class.html) pour récupérer la largeur de l'écran. En plus de l'image, affichez la largeur de l'écran fourni par `LayoutBuilder` en  haut de celle-ci. L'image et la largeur devraient changer lorsque vous mettez le téléphone en mode paysage ou portrait. Ce n'est pas grave si vous voyez de la "construction" en bas de l'écran, mais si vous ne comprenez pas ce que ça fait, appellez votre enseignant pour qu'il en discute avec vous.

Vous **devez** implémenter un `loadingBuilder` pour comprendre le processus de chargement des images. N'hésitez pas réutiliser celui de la démonstration [image_client](https://github.com/departement-info-cem/5N6-mobile-2/blob/main/code/image_client/lib/page/network_page.dart#L34-L60).