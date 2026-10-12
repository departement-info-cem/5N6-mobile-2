# Supabase 🆙

## Supabase, création du projet

Naviguez sur [la page de connexion de Supabase](https://supabase.com/dashboard/sign-in). Nous vous recommendons de vous connecter avec votre compte GitHub. 

<NonVoyant>Les libellés de l'interface de Supabase sont en anglais. Les noms entre guillemets dans les étapes ci-dessous correspondent exactement au texte lu par votre lecteur d'écran.</NonVoyant>

### Créer l'organisation

Sur la page « Create a new organization » :

1. Dans le champ **Name**, inscrivez le nom de votre organisation (par exemple `SuperProjet`).
2. Laissez **Type of organization** à « Personal » et **Plan** à « Free - $0/month ».
3. Cliquez sur le bouton **Create organization**.
4. Vous aboutissez sur la page de création de projet.

### Créer le projet

Sur la page « Create a new project » :

1. Dans la liste **Organization**, vérifiez que l'organisation créée à l'étape précédente est sélectionnée.
2. Vous pouvez **Connect to GitHub**, mais ce n'est pas nécessaire pour l'usage que nous allons en faire dans ce projet.
3. Dans le champ **Project name**, donnez un nom à votre projet.
4. Dans le champ **Database Password**, inscrivez un mot de passe fort et conservez-le en lieu sûr. <NonVoyant>La robustesse du mot de passe est indiquée seulement par une ligne de couleur sous le champ. Le lien « Generate a password », situé près du champ, produit un mot de passe fort automatiquement.</NonVoyant>
5. Laissez la **Region** proposée (par exemple « Americas »).
6. Les options de sécurité à cocher n'importent pas pour notre cas.
7. Cliquez sur le bouton **Create new project**. La création du projet peut prendre quelques minutes.

### Récupérer l'URL et la clé du projet

1. Dans la zone du haut, cliquez sur le bouton vert **Connect**. <NonVoyant>Le raccourci avec les touches `o` puis `c` fonctionne aussi.</NonVoyant> Un panneau devrait souvrir à droite de l'écran.
2. Sélectionnez l'option **Framework - Use a client library** si ce n'est pas déjà fait.
3. Dans le menu à dérouler pour choisir le framework, sélectionnez **Flutter**.
4. Suivez les instructions, donc l'installation du package `supabase_flutter` et pour le fichier `lib/main.dart`.

:::tip
Les valeurs fournies ne devraient pas se retrouver directement dans `main`. Pour un projet propre, extrayez la valeur de `url` dans une [configuration](./configuration.md), et celle de `anonKey` dans des [secrets](./secret.md). 
:::


## Supabase, configurer les droits d'accès

Il faut créer deux politiques d'accès (*policies*) : une pour les buckets et une pour les objets (les fichiers) qu'ils contiennent.

### Ajouter les droits pour les buckets

1. Dans le menu de navigation principal à gauche, cliquez sur **Storage**. <NonVoyant>Ce menu peut n'afficher que des icônes; chaque lien porte tout de même un nom accessible, comme « Storage ».</NonVoyant>
2. Dans le panneau secondaire de Storage, Files devrait être déjà sélectionn. Sélectionnez la rubrique **Policies** la rubrique.
3. Repérez la section **Policies under storage.buckets**, puis cliquez sur le bouton **New policy** de cette section.
4. Dans la boîte de dialogue « Adding new policy to storage.buckets », choisissez l'option **For full customization** (« Create a policy from scratch »).
5. Remplissez le formulaire :
   - **Policy name** : `Everything for all`;
   - **Allowed operation** : sélectionnez **ALL**;
   - **Target roles** : ne sélectionnez rien (tous les rôles publics sont visés par défaut);
   - **USING expression** : inscrivez `true`. <NonVoyant>Ce champ est un éditeur de code : placez-y le focus, puis tapez true.</NonVoyant>
    - **USING CHECK expression** : laissez vide.
6. Cliquez sur **Review**.
7. Vérifiez le code SQL affiché, qui doit correspondre à celui-ci, puis cliquez sur **Save policy**.

```sql
CREATE POLICY "Everything for all" ON "storage"."buckets"
AS PERMISSIVE FOR ALL
TO public
USING (true)
```

### Ajouter les droits pour les objets (images) dans les buckets

1. Toujours dans **Storage** > **Policies**, repérez la section **Other policies under storage.objects**, puis cliquez sur le bouton **New policy** de cette section.
2. Dans la boîte de dialogue « Adding new policy to storage.objects », choisissez l'option **For full customization** (« Create a policy from scratch »).
3. Remplissez le formulaire de la même façon que pour les buckets :
   - **Policy name** : `Everything for all`;
   - **Allowed operation** : sélectionnez **ALL**;
   - **Target roles** : ne sélectionnez rien (tous les rôles publics sont visés par défaut);
   - **USING expression** : inscrivez `true`. <NonVoyant>Ce champ est un éditeur de code : placez-y le focus, puis tapez true.</NonVoyant>
    - **USING CHECK expression** : laissez vide.
4. Cliquez sur **Review**, puis sur **Save policy**.
5. Vérifiez le code SQL affiché, qui doit correspondre à celui-ci, puis cliquez sur **Save policy**.

```sql
CREATE POLICY "Everything for all" ON "storage"."objects"
AS PERMISSIVE FOR ALL
TO public
USING (true)
```
:::warning
Ces politiques donnent tous les droits à tout le monde. Elles conviennent pour un exercice, mais pas pour une application en production.
:::

## Supabase, créer un bucket public

### Créer le bucket par l'interface

1. Sélectionnez l'onglet **Buckets**.
2. Cliquez sur le bouton **New bucket**.
3. Dans la boîte de dialogue « Create storage bucket » :
   - sous **Name of bucket**, inscrivez le nom du bucket (par exemple `supabucket`). Ce nom ne peut plus être modifié par la suite et n'accepte que des lettres minuscules, des chiffres, des points et des tirets;
   - activez l'interrupteur **Public bucket**, pour que tout le monde puisse lire les fichiers sans autorisation. <NonVoyant>L'interrupteur est activé lorsque votre lecteur d'écran l'annonce comme coché.</NonVoyant>
   - Pour un usage ouvert au public, les options **Restrict file size** et **Restrict MIME types** devraient être cochées. Quelqu'un pourrait décider de mettre des **énormes** fichiers de n'importe quels types **louches** dans votre système. Par contre ça supposerait qu'il y aurait une gestion des cas problématiques fait par votre système, en amont. 
4. Cliquez sur **Create**.

:::danger
Comme c'est indiqué, un bucket public est accessible en lecture sans autorisation, mais les autres opérations (téléversement, suppression) restent soumises aux politiques d'accès créées plus haut.
:::

Tout est prêt pour que des images puissent être envoyées de votre projet à Supabase.

## Ajouter une image

```dart
final supabase = Supabase.instance.client;

//TODO doc: https://supabase.com/docs/reference/dart/storage-from-upload
final String fullPath = await supabase
  .storage
  .from('le-nom-de-mon-bucket')
  .upload(
    //TODO Mettre un nom unique
    "nom-du-fichier",
    File("path-du-fichier")
  );
```

## Récupérer une image

```dart
final supabase = Supabase.instance.client;

//TODO doc: https://supabase.com/docs/reference/dart/storage-from-getpublicurl
string url = supabase
  .storage
  .from('le-nom-de-mon-bucket')
  // TODO le bucket doit être public pour qu'on puisse récupérer l'URL public
  .getPublicUrl("nom-du-fichier");
```

## Exemple de code

Vous pouvez regarder l'exemple de code **[supabase_storage](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-supabase_storage.zip)**.
