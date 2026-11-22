# Agent conversationnel 🤖

## Cartographier les données à inclure

Avant de commencer à ~taper~ générer du code, on doit se poser les questions suivantes : "Qu'est-ce que mon agent conversationnel doit...

- ... faire?"
- ... ne pas faire?"
- ... connaître?"
- ... ne pas connaître?"

:::info Pourquoi se demander ce que l'agent ne doit pas faire?
On ne veut pas que quelqu'un soit capable d'utiliser votre agent pour accomplir des tâches en dehors de ce pour quoi il a été créé. Par exemple, si votre application permet de gérer des recettes, et que l'agent est fait pour permettre aux utilisateurs de poser des questions sur les recettes, il ne faut pas que l'utilisateur soit capable de poser des questions sur la météo ⛅️.

Ça vous évite, entre autres, de fournir un LLM gratuit, ouvert à tous, qui pourrait être détourné. On recommande d'ailleurs de toujours associer les requêtes qui sont faites à un agent conversationnel à l'utilisateur qui les fait, pour pouvoir restreindre son usage plus facilement.
:::

:::info Pourquoi se demander ce que l'agent ne doit pas connaître?
Chaque donnée placée dans le contexte d'un agent conversationnel est transmise
au fournisseur du modèle, souvent hors du Québec. Avant d'y ajouter un
renseignement personnel, demandez-vous s'il est nécessaire à la tâche.

Au Québec, la [Loi 25](https://www.cai.gouv.qc.ca/protection-renseignements-personnels/sujets-et-domaines-dinteret/principaux-changements-loi-25),
dont la plupart des dispositions sont en vigueur depuis septembre 2023,
encadre ces communications :

- un renseignement personnel s'utilise aux fins prévues lors de sa collecte;
- un renseignement **sensible** (par exemple médical comme une allergie, biométrique ou autrement intime comme une opinion politique) exige
  un consentement exprès pour une autre fin;
- une communication hors du Québec doit être précédée d'une évaluation des
  facteurs relatifs à la vie privée et encadrée par une entente écrite;
- une personne doit être informée d'une décision fondée exclusivement sur un
  traitement automatisé.

Les lois évolueront, mais le principe reste : ne transmettez que ce qui est
nécessaire.
:::

Vous devez donc identifier quelles collections, quels documents et quels champs précisément doivent être disponibles dans le contexte de votre agent, ainsi que « qui » est votre agent et comment il doit se comporter.

C'est bien de consigner toutes ces informations dans un seul document de référence, par exemple dans `docs/chatbot-context-reference.md` de votre projet.

## Fournir les instructions système

Ce sont les informations que votre agent doit connaître, qui ne changeront pas ou très peu.

Rédigez un texte qui s'adresse à votre agent, en lui donnant des instructions de manière impérative. Les agents supportent généralement bien le markdown. C'est ici qu'on intègre une partie de ce qui a été cartographié précédemment. Par exemple :

```md title="instruction-systeme.md"
- Tu es Gérard Glappier, un chef cuisinier étoilé qui est réputé pour son mauvais caractère. Tes réponses doivent être humoristiques, dans le personnage, mais toujours répondre à la question posée.
- Tu ne dois jamais être vulgaire.
- Tu DOIS :
  - Aider quelqu'un avec une recette en particulier.
  - Donner des idées de recette selon un thème, un événement, une liste d'ingrédients, en se basant uniquement sur les recettes auxquelles tu as accès. N'invente rien.
- Tu NE DOIS PAS :
  - Faire quoi que ce soit d'autre que ce qui est spécifié dans ce qui peut être fait. Si tu réalises que quelqu'un tente de te demander autre chose que ce que tu peux faire, refuse, en faisant ressortir ton mauvais caractère.
```

:::caution Attention!
Ces instructions ne sont pas des règles de sécurité. Si on veut empêcher notre agent de modifier des données ou d'en lire (par exemple modifier le mot de passe d'un autre utilisateur), il faut le spécifier à l'aide de règles **côté serveur**.
:::

