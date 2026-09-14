---
description: Convertir une liste JSON en objets Dart et l'afficher
hide_table_of_contents: true
---

# DIO 3 - Objet et liste JSON

- Un JSON qui commence par `{` représente un objet.
- Un JSON qui commence par `[` représente une liste.
- Un JSON qui commence par `"` représente une chaîne de caractères.

Créez une classe Dart pour les objets complexes et convertissez chaque élément de la liste.

## Définir une classe de transfert

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/http/02-json_list/lib/transfert.dart"
/>

Pour automatiser `fromJson` et `toJson`, le projet [02-json_list](https://github.com/departement-info-cem/5N6-mobile-2/tree/main/code/http/02-json_list) utilise aussi `json_annotation`, `build_runner` et `json_serializable`.

## Convertir la réponse en liste typée

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/http/02-json_list/lib/main.dart"
  startLine="71"
  endLine="89"
/>

## Afficher la liste

Conservez la liste dans l'état de votre écran et utilisez `ListView.builder` pour construire seulement les éléments visibles. Chaque élément peut être affiché dans un `ListTile` avec ses propriétés.
