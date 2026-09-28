# Bruno 🐕

[Bruno](https://www.usebruno.com/) est un client qui permet de faciliter l'envoie de requêtes HTTP. C'est un bon outil pour tester les requêtes HTTP rapidement.

Installez l'outil sur votre ordinateur personnel avant de commencer cette recette. Bruno est aussi préinstallé sur les postes du CÉGEP.

Pour les besoins de la recette, nous allons utiliser quelques API différentes, dont [REST Countries](https://restcountries.com/). Créez vous un compte, et obtenez une clé d'API. 

:::warning
REST Countries fournit 1000 requêtes gratuites à leur API par mois. C'est amplement suffisant pour nos besoins, mais c'est assez peu pour vous avertir d'être minimalement parcimonieux!
:::

## Collections 📚

Généralement, on garde une collection par source de données, ou par projet.

Créez une collection nommée REST Countries.

## Envoyer une requête ➡️

Le premier objectif sera d'effectuer une recherche simple dans la liste des pays du monde.

Créez une requête `GET` avec cette recherche : 

```http
https://api.restcountries.com/countries/v5?q=uni
```

Renommez la requête "Recherche" pour mieux la retrouver plus tard.

Vous risquez d'obtenir un résultat semblable à celui-ci :

```json
{
  "errors": [
    {
      "message": "Authorization key required.",
      "code": "authKeyMissing"
    }
  ]
}
```

## En-têtes 🎩

L'API nous répond qu'il manque la clé d'API. Nous devons donc la lui fournir. Essayez d'y arriver par vous-même en consultat la [documentation de l'API](https://restcountries.com/docs#authentication).

<details>
  <summary>Solution</summary>
  Dans l'onglet **Headers**, ajoutez l'entrée suivante :

  | Name | Value | Description |
  |------|-------|-------------|
  |Authorization|Bearer rc_live_et_le_rest_de_votre_cle_d_api||
</details>

Réessayez la requête. Vous devriez voir la réponse JSON dans la partie de droite.

## Résultat ⬅️

Souvent, ce n'est qu'une partie très précise d'une réponse d'API qui nous intéresse, plutôt que l'objet au complet.

Pour vous aider à mieux consommer la réponse, nous vous recommandons de sélectionner JSON et de cocher l'option **Preview** dans les option de visualisation, où vous voyez un icône d'oeil.

La vue vous permet d'explorer pas à pas les différents niveaux de la réponse.

## Rendre le tout plus propre 🧹

Quelques éléments peuvent être améliorés, surtout si vous comptez partager les collections avec d'autres membres de l'équipe.

### Authentification

Vous remarquerez que **toutes** les requêtes vers REST Countries nécessitent d'inclure la clé d'API dans le header. C'est possible de spécifier à une collection d'inclure la clé dans les headers.

On peut aller dans `... sur nom de la collection > Settings > Auth > Bearer Token dans la liste déroulante`

Insérer simplement la clé d'API (sans `Bearer ` avant). 

Pour bien tester, n'oubliez pas d'enlever l'en-tête dans la requête HTTP qui a été créée plus tôt.

:::tip
Les prochaines sections de cette recette concernent moins l'exemple de REST Countries, et plutôt davantage les API développés par vous-même, en général.
:::

### Environnements

C'est souvent nécessaire d'être capable de passer rapidement d'un environnement de développement à un environnement de production. Entre ces 2 environnements, l'url du serveur (ex : http://localhost:5196 vs https://api.monsite.org), certaines clé d'API, etc.

1. Dans Bruno, en haut à droite, trouvez "No Environment", et cliquez dessus. 
2. Dans l'onglet **Collection**, cliquez sur **Create**.
3. Comme nom, choisissez par exemple "Développement" ou "Production".

Les onglets **Variables** et **Secrets** accomplissent la même chose : vous fournir des clés-valeur auquelles vous pouvez vous référer. **Variables** est pour les données qui ne sont pas sensibles (ex : url du serveur), et **Secrets** est pour les données sensibles (ex : clés d'API).

Définissons la clé-valeur suivante dans **Variables** :

| Name | Value | Description |
|------|-------|-------------|
|server_url|https://api.restcountries.com||

N'oubliez pas de sauvegarder! `Ctrl + S`

De retour dans la requête de recherche, créée plus tôt, on peut remplacer `https://api.restcountries.com/countries/v5?q=uni` par `{{server_url}}/countries/v5?q=uni`.

On devine qu'il sera ensuite possible de créer d'autres environnements, et de leur définir les même clés, mais avec des valeurs différentes.

## Spécification OpenAPI

Certaines API (pas REST Countries malheureusement) fournissent une spécification [OpenAPI](https://www.openapis.org/about) qui est un standard de documentation des requêtes HTTP. En gros, ça vous évite d'avoir à écrire à la main toutes les requêtes dans Bruno.

Par exemple, GitHub fournit l'entièreté de la spécification de ses appels HTTP au format OpenAPI, disponible [ici](https://github.com/github/rest-api-description/raw/refs/heads/main/descriptions/api.github.com/api.github.com.json).
 
Vous pouvez simplement créer une nouvelle collection vide, dans les options de la collection (`...`), sélectionner l'option OpenAPI, et coller l'url du lien ci-haut. Vous vous rendrez compte que GitHub fournit **beaucoup** de points d'entrée vers leur API.

Cette fonctionnalité vous permet aussi de détecter lorsque des points d'entrée ont été modifiés, et bien plus.

:::tip
D'ailleurs, certains frameworks permettent par défaut de générer une spécification OpenAPI, en se basant sur ce que les controlleurs reçoivent et renvoient.

**C'est notemment le cas des projets .NET que vous utilisez dans vos cours de web. La spécification est souvent disponible par défaut via localhost:#_DE_PORT/openapi/v1.json essayez le dans votre cours de web pour impressionner votre prof!**.
:::
