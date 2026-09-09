# Serverless 🔥

## Concept général

Vous avez peut-être déjà entendu parler de **serverless**. C'est un terme qui peut être trompeur, car il ne signifie pas qu'il n'y a pas de serveur. En réalité, il signifie que : 

1. Ce n'est pas vous qui administrez le serveur.
2. La mise à l'échelle automatique : c'est possible de passer de 100 requêtes par jour à 1000 requêtes par seconde sans rien toucher.

Vous n'avez plus à écrire de code serveur pour intéragir avec la base de données, comme c'était le cas dans vos cours de web et de développement mobile. Dans notre cas, le client (ex : application Flutter ou site web) communique directement avec le fournisseur de service **serverless**. Dans cette page, nous allons résumer à haut niveau différents services **serverless** possibles.

Cette session, nous allons utiliser [**Firebase**](https://firebase.google.com/) de Google, qui regroupe plusieurs services Serverless. 

:::tip
Il existe d'autres fournisseurs de services **serverless** comme [**Supabase**](https://supabase.com/) ou [**AWS Amplify**](https://aws.amazon.com/amplify/).
:::

## Authentification

Vous avez peut-être remarqués que le code serveur que vous écrivez pour de l'authentification se ressemble toujours eu peu : 

- Quand un utilisateur créer un compte, il doit fournir minimalement un identifiant (ex : courriel, nom d'utilisateur) et un mot de passe, qui respecte certains critères.
- Quand un utilisateur se connecte, on veut vérifier que les informations qui ont été entrées correspondent à la combinaison identifiant - mot de passe de l'utilisateur.

C'est du code assez ennuyeux à écrire puisqu'il est généralement redondant, mais critique pour la sécurité de votre application.

Des services comme Firebase Auth, Okta, auth0 et entra, pour vous offrent de faire cette gestion redondante. En toute franchise, leur code est probablement plus sécuritaire que celui d'étudiants au DEC en troisième année!

Votre application cliente n'a donc qu'à envoyer les informations requises, et être capable d'obtenir une réponse, et envoyer le token d'authentification que le service vous renvoie. Tout le reste est géré.

Plusieurs services aggrègent même différents services d'authentification. Par exemple, avec Firebase Aauth, c'est possible de d'offrir à vos utilisateurs de se connecter à partir de :

- Courriel + Mot de passe
- Google SignIn
- Facebook
- Apple
- GitHub
- Microsoft
- Numéro de téléphone
- Et quelques autres!

## Base de données

On vous a souvent expliqué que ce n'est normalement pas une bonne idée pour un client de communiquer directement avec une base de données, pour des raisons de sécurité. C'est généralement encore vrai, mais dans certains cas, on arrive à exposer la base de données au client en incluant une couche de sécurité autour.

Avec Firebase Storage, vous allez intéragir directement avec la base de données. C'est un nouveau concept de base de données qui s'appelle "Orienté document", mais nous y renviendons en temps et lieu.

## Fonctions

Les Cloud functions sont, commee son nom l'indique, des fonctions, qui sont exécutées directement. Elles sont beaucoup plus simple que les framework avec lesquels vous avez intéragis, comme .NET Core ou SpringBoot. Ici il n'est pas question de contrôleurs, de services, de Middleware, ou autre.

C'est simplement des fonctions qui peuvent être appelées depuis le client, qui peuvent ensuite interagir avec la base de données, et bien plus.

Nous allons voir que nous sommes capable d'accomplir beaucoup de choses sans avoir recours aux Cloud Functions, en intéragissant directement avec la base de donnnées de Firebase.

## Écosystème

"L'écosystème" est un autre terme marketing souvent utilisé chez Apple, qui signifie que les différents produits sont faits pour fonctionner ensemble. C'est le cas de Firebase, et de la plupart des services **serverless**, qui misent sur l'intégration entre chacun des services qu'ils offrent. Par exemple, Firebase propose de valider le contrôle d'accès en utilisant les données du service d'authentification.

:::caution
En général, une fois qu'on a choisi un fournisseur de services **serverless**, il est difficile de changer pour un autre fournisseur. Il est donc important de bien choisir son fournisseur avant de commencer à développer son application. Autrement on est pris dans la jungle de l'écosystème.
:::