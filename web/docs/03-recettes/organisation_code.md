# Organisation 🧹

## Organisation du projet

Nous vous suggérons cette organisation de fichiers et de dossiers :

```mermaid
---
config:
  treeView:
    showIcons: true
---
treeView-beta
    lib/
        models/ ## Classes simples ou dtos
            chose.dart
        pages/ ## Pages naviguables
            chose_page.dart
            home_page.dart
            signin_page.dart
            signup_page.dart
        services/ ## Services pour communiquer avec le backend
            auth_service.dart
            chose_service.dart
        widgets/ ## Widgets réutilisables
            drawer.dart
            chose_widget.dart
        main.dart
```

:::tip
Cette organisation est une suggestion, surtout pas un dogme : vous pouvez l'adapter à vos besoins. L'important est de garder une structure claire et cohérente pour faciliter la maintenance et la compréhension du code. Vous risquez de trouver des projets Flutter avec une organisation différente, mais l'idée générale est de séparer les différentes parties de votre application pour qu'elles soient faciles à retrouver et à modifier.
:::

## Extraire des widgets

Une méthode ne devrait pas faire plus d'un écran. Encore une fois, il n'y a pas de règle stricte, mais c'est une bonne pratique pour garder votre code lisible et maintenable.

Ainsi, si vous avez un widget qui a une méthode `build()` qui est plus grande qu'un écran, mieux vaut en extraire quelques widgets pour mieux organiser notre code.

Pour faciliter la démarche de subdiviser votre code, positionnez votre curseur sur le code que vous souhaitez extraire, et utilisez la commande `Ctrl + .` et sélectionnez l'une des options suivantes :

- `Extract Method` : lorsque le bloc de code à extraire fait du sens seulement dans le contexte du widget ou de la page où il se trouve
- `Extract Widget` : pour extraire un widget, qui a des changes d'être réutilisé ailleurs dans votre application. La plupart des widgets vivent dans leurs propres fichiers.

## Rappel : Public et privé

Lors du premier cours, vous avez vu qu'en Dart, il n'y pas de mots clés pour `public` `private` et `protected`, on utilise plutôt le souligner `_` pour ajouter une variable privée à une librairie.

De plus, en Dart tout fichier (plus ses `part`) est considéré comme une librairie.