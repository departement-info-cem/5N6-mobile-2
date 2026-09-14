---
description: Afficher une réponse HTTP dans une interface Flutter
hide_table_of_contents: true
---

# DIO 2 - Appel depuis l'interface

Une requête HTTP est asynchrone. Dans un `StatefulWidget`, conservez donc le résultat et l'état de la requête dans l'état du widget, puis appelez `setState` lorsque la réponse arrive.

## Appeler le service depuis un bouton

```dart
class _MonEcranState extends State<MonEcran> {
  final Dio dio = Dio();
  int? resultat;
  String? erreur;
  bool chargement = false;

  Future<void> doubler(int nombre) async {
    setState(() {
      chargement = true;
      erreur = null;
    });

    try {
      final response = await dio.get(
        'https://fourn6-mobile-prof.onrender.com/exos/long/double/$nombre',
      );
      setState(() => resultat = response.data as int);
    } on DioException catch (exception) {
      setState(() => erreur = exception.message);
    } finally {
      if (mounted) {
        setState(() => chargement = false);
      }
    }
  }
}
```

Le test `mounted` évite de modifier l'état d'un écran qui aurait été fermé pendant l'appel réseau.

## Afficher les trois états

L'interface doit indiquer clairement si elle attend une réponse, si elle a reçu une valeur ou si une erreur est survenue.

```dart
if (chargement) {
  const CircularProgressIndicator();
} else if (erreur != null) {
  Text('Erreur : $erreur');
} else if (resultat != null) {
  Text('Le double est $resultat');
}
```

Le projet [01-acces_simple](https://github.com/departement-info-cem/5N6-mobile-2/tree/main/code/http/01-acces_simple) fournit une première démonstration d'un appel DIO depuis une interface. Ajoutez l'état de chargement et le message d'erreur dans vos propres applications.

