---
description: Afficher une réponse HTTP dans une interface Flutter
hide_table_of_contents: true
---

# DIO 2 - Appel depuis l'interface

Une requête HTTP est asynchrone. Dans un `StatefulWidget`, conservez donc le résultat dans l'état du widget, puis appelez `setState` lorsque la réponse arrive.

## Appeler le service depuis un bouton

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/http/01-acces_simple/lib/main.dart"
  startLine="30"
  endLine="70"
/>

## Afficher les états

L'interface doit indiquer clairement si elle attend une réponse, si elle a reçu une valeur ou si une erreur est survenue. Ajoutez un `CircularProgressIndicator` pendant l'appel, puis affichez le résultat ou un message d'erreur à l'arrivée de la réponse.

Le projet [01-acces_simple](https://github.com/departement-info-cem/5N6-mobile-2/tree/main/code/http/01-acces_simple) fournit une première démonstration d'un appel DIO depuis une interface.
