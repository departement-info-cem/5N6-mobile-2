---
description: Transitions animées entre écrans
hide_table_of_contents: true
---

# Hero

<Row>

<Column>

:::tip Avant la séance

Lisez la doc Flutter sur le widget [Hero](https://docs.flutter.dev/ui/animations/hero-animations) et la page sur les [animations implicites](https://docs.flutter.dev/ui/animations/implicit-animations) pour comprendre comment Flutter gère les animations sans `AnimationController`.

Clonez et ouvrez le code de demo dans [`code/hero`](https://github.com/departement-info-cem/5N6-mobile-2/tree/main/code/hero). Cherchez les `TODO` dans le code pour voir ou placer les `Hero` et comment choisir les `tag`.

:::

</Column>

<Column>

:::info Séance

- Rappel: une transition Hero fait voler un widget entre deux routes partageant le même `tag`.
- Comment entourer une image ou un widget avec `Hero` et naviguer avec `Navigator.push` / `pop`.
- Comment gérer plusieurs Hero dans une liste (utiliser des `tag` uniques) et éviter les clignotements avec `placeholderBuilder`.
- Personnaliser l'animation avec `flightShuttleBuilder` ou des `Tween` sur la cible.

:::

</Column>

</Row>

:::note Exercices

Pas d'exercice, implémentez les Hero dans votre travail pratique pour la transition de l'écran d'accueil vers les détails.

:::