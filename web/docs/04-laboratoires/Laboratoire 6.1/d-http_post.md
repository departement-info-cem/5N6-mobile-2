# 📤 6.1D – http_post

## Objectif 🎯

Envoyer un objet JSON avec une requête POST, puis afficher l'objet reçu en réponse.

## À faire 🛠️

1. Créez un projet Flutter nommé `http_post`.
2. Envoyez une requête POST à `https://fourn6-mobile-prof.onrender.com/exos/truc/doubler`.
3. Le corps de la requête doit avoir ce format :

```json
{
  "a": 100,
  "b": "gndsadsa",
  "c": [8, 12, 14, 18, 1998]
}
```

4. Créez une classe Dart pour cet objet et envoyez son résultat `toJson()` dans `data`.
5. Le service retourne le même format. Convertissez cette réponse en objet Dart et affichez ses propriétés dans l'interface.
6. Interceptez `DioException`; lorsqu'une réponse est disponible, affichez son code HTTP et son contenu pour faciliter le débogage.

Consultez la recette [DIO 4 - POST et cookies](../../03-recettes/dio-04-cookie-post.md).

