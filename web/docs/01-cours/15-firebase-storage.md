---
description: Stocker des fichiers
hide_table_of_contents: true
---

# Firebase/Supabase: Gestion des images

:::tip Avant la séance :

Les deux technologies décrites ci-dessous reposent sur les mêmes concepts. C'est relativement facile de passer de firebase à supabase et vis versa.

## Version Firebase gratuite (émulateur) ou payante (console Firebase) (nécessite une carte de crédit)

Si vous désirez utiliser la version payante (sur la console Firebase) de consultez la section [Storage Emulator](../03-recettes/emulateurs_firebase.md#storage-emulator-) de la recette sur les émulateurs.

Si vous désirez utiliser Firebase Storage, assurer vous de bien **fixer un maximum de facturation** sur votre carte de crédit. Pour l'usage que nous en ferons, il serait étonnant que vous dépassiez 2$. Vous devrez activer Firebase Storage dans la console Firebase et refaire un `flutterfire configure` dans votre projet pour ajouter le lien vers la console dans votre configuration.

Consultez ce projet de démonstration pour [Firebase Storage](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-firebase_storage_demo.zip). Il fonctionne avec l'émulateur.

## Version gratuite avec Supabase

Supabase est une alternative open source à Firebase.

Pour la mise en place, vous devez suivre les étapes décrites dans [Supabase 🆙](../03-recettes/supabase.md).

Consultez l'exemple de code [supabase_storage](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-supabase_storage.zip).

:::

:::info Séance :

On regardera comment une image est envoyée puis sauvée par Firebase/Supabase.

On regardera également comment les images sont accédées puis servies par Firebase/Supabase.

:::
