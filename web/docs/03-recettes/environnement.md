# Secrets 🤫

Pour s'interfacer à des services externes (souvent payants ou limités), votre application a généralement besoin d'utiliser des clés d'API fournies par ces services externes.

Ces clés d'API sont considérées comme des données sensibles. Imaginez si quelqu'un de mal intentionné se retrouvait à être en possession d'une clé. Il pourrait agir en votre nom, et utiliser toutes les limites d'utilisation du service que vous utilisez. C'est généralement même recommandé de limiter l'accès à ces clés au sein d'une même équipe de développement. Il vaut donc mieux ne pas les inclure dans un repo Git.

Pour notre exemple, nous allons utiliser le service [REST Countries](https://restcountries.com/). Créez vous un compte, et trouvez la clé d'API créée par défaut. Elle devrait commencer par `rc_live`. Cette clé est votre **laissez-passer 🪪** pour intéragir avec l'API de REST Countries.

:::caution 
Si par mégarde, ça vous arrive, il faut immédiatement faire une [**rotation**](https://www.cydenti.com/fr/glossary/secret-rotation/). Si ça arrive dans votre vie professionnelle, avertissez votre superviseur dans les plus brefs délais.
:::

### 2.1 `.env` 🏞️

Nous allons ajouter le token dans un fichier `.env` qui n'est qu'une liste de clé=valeur.

```env
REST_COUNTRIES_API_KEY=VOTRE_CLÉ_ICI!!!
```

Pour éviter que `.env` ne se retrouve dans votre repo git, ajoutons le à votre `.gitignore` :

```gitignore
// Reste des éléments ignorés

.env
```

### 2.2 `flutter_dotenv` 🐦🏞️

Le package [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv) va nous permettre d'utiliser les valeurs qui sont dans `.env` dans notre code.

Suivez les instructions sur la page du package pour compléter son installation. Un exemple est fourni pour utiliser la librairie.

:::danger Attention!
S'il n'y a aucune clé valeur dans votre fichier `.env`, le lancement de l'application va échouer.
:::

### 2.3 Bonus : `.env.example` 🏞️🏞️

Si jamais vous voulez être gentil avec votre futur vous, vous pouvez créer un fichier `.env.example` qui est une copie de `.env`, mais sans les valeurs. Ainsi c'est plus rapide de savoir quelles tokens vous devez garder. 

```env
REST_COUNTRIES_API_KEY=
```

:::tip
C'est assez standard de devoir utiliser un token pour accéder à un service externe. Par contre, ce qui n'est pas standard, c'est de stocker le token sur le client (votre application). La bonne pratique serait de passer par un serveur (ex : .NET Core, SpringBoot, etc.) pour faire les requêtes, pour éviter que n'importe qui puisse récupérer le token et faire des requêtes en votre nom 🥸. La documentation de [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv#security) en fait d'ailleurs mention.
:::
