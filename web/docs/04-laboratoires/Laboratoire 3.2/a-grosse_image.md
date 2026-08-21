# 🔭 3.2A – grosse_image

## Objectifs 🎯

Comprendre l'impact du téléchargement d'images réseau très lourdes sur les performances de l'interface et réaliser l'importance du mécanisme de mise en cache.

## À faire 🛠️

1. **La liste lourde** : Créez un `ListView` qui affiche au moins 20 fois la même image réseau à partir de cette URL : [https://cdn.esawebb.org/archives/images/large/weic2205a.jpg](https://cdn.esawebb.org/archives/images/large/weic2205a.jpg) (Attention : elle pèse 17.8 Mo !)
2. **Le test de performance (sans cache)** : Par défaut, Flutter va télécharger l'image une seule fois et la mettre en cache. Pour contourner ce comportement et forcer le retéléchargement à chaque fois, ajoutez un paramètre unique à la fin de l'URL pour chaque image générée (par exemple en utilisant l'index : `...?v=$index` ou l'heure actuelle).
3. **L'observation** : Faites défiler votre liste. Le défilement devrait devenir saccadé et l'utilisation très désagréable en raison des téléchargements massifs répétés. Vous pouvez également utiliser le [`loadingBuilder`](https://github.com/departement-info-cem/5N6-mobile-2/blob/main/code/image_client/lib/page/network_page.dart#L34-L60) qui est dans la démonstration du [image_client](https://github.com/departement-info-cem/5N6-mobile-2/tree/main/code/image_client) pour voir à quelle vitesse le chargement des images progresse.
4. **La comparaison** : Retirez le paramètre unique de votre URL pour réactiver la mise en cache par défaut, relancez l'application et observez la différence de fluidité.