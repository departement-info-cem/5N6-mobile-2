---
description: Convertir une liste JSON en objets Dart et l'afficher
hide_table_of_contents: true
---

# DIO 3 - Objet et liste JSON


- Un JSON qui commence par `{` représente un objet.
- un JSON qui commence par `[` représente une liste. 
- Un JSON qui commence par `"` représente une string.

Créez une classe Dart pour les objets complexes et convertissez chaque élément de la liste.

## Définir une classe de transfert

```dart
class Truc {
  const Truc({required this.a, required this.b, required this.c});

  final int a;
  final String b;
  final List<int> c;

  factory Truc.fromJson(Map<String, dynamic> json) {
    return Truc(
      a: json['a'] as int,
      b: json['b'] as String,
      c: List<int>.from(json['c'] as List),
    );
  }
}
```

Pour automatiser `fromJson` et `toJson`, le projet [02-json_list](https://github.com/departement-info-cem/5N6-mobile-2/tree/main/code/http/02-json_list) utilise aussi `json_annotation`, `build_runner` et `json_serializable`.

## Convertir la réponse en liste typée

```dart
final response = await dio.get(
  'https://fourn6-mobile-prof.onrender.com/exos/truc/list',
);

final elementsJson = response.data as List;
final trucs = elementsJson
    .map((element) => Truc.fromJson(element as Map<String, dynamic>))
    .toList();
```

## Afficher la liste

Conservez la liste dans l'état de votre écran et utilisez `ListView.builder` pour construire seulement les éléments visibles :

```dart
ListView.builder(
  itemCount: trucs.length,
  itemBuilder: (context, index) {
    final truc = trucs[index];
    return ListTile(
      title: Text(truc.b),
      subtitle: Text('a : ${truc.a}, ${truc.c.length} nombres'),
    );
  },
)
```

