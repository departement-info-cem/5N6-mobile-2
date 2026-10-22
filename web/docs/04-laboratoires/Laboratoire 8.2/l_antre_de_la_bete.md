# 👹 8.2A - l_antre_de_la_bete.apk

![Capture d'écran tirée d'un dessin animé d'Astérix. La scène montre Astérix, Obélix et un petit guide en tunique verte debout dans une vaste grotte sombre aux parois rocheuses et verdâtres. Au centre, Obélix, grand et fort avec ses tresses rousses et son pantalon à rayures bleues et blanches, se tient les mains sur les hanches et regarde d'un air hébété vers le haut de la caverne. À sa gauche, le petit guerrier Astérix, portant sa moustache blonde et son casque ailé, écoute attentivement. À droite, le petit homme aux cheveux bruns s'adresse à eux, de profil, en tenant un dossier sous le bras. Au bas de l'image, un sous-titre jaune affiche le dialogue : « Il vous faudra pénétrer dans l'Antre de la Bête. »](./_l_antre_de_la_bete.webp)

## Objectifs 🎯

- Apprendre à décompiler un `.apk` .
- Comprendre pourquoi ce n'est pas sécuritaire de cacher des secrets sur une application client.

## À faire 🛠️

Téléchargez [cet apk](https://info.cegepmontpetit.ca/ctf/antre_de_la_bete.apk).

### Drôle de monstre 👹

Les développeurs de l’application ont oublié de faire le ménage dans les images utilisées par celle-ci. Il semblerait que l’une d’elles soit assez sensible pour que personne ne doive la voir, sous aucun prétexte.

Essayez de retrouver cette image.

:::tip Indice
N'hésitez pas à vous référer à [cette section](../../03-recettes/deploiement-android.md#apk) des notes de cours. Remarquez quel dossier fait quoi dans une archive de `.apk` extraite.
:::

N'oubliez pas de soumettre le flag ici.

<NonVoyant>Demandez à votre enseignant de vous lire le texte sur l'image, ou passez la dans un LLM en lui demandant de vous donner le texte qui est sur l'image. La réponse devrait commencer par "CEM".</NonVoyant>

### Serveur compromis 👀

Nous avons oublié de retirer l'URL qui pointe vers notre serveur dans les [secrets](../../03-recettes/secret.md). Le problème : le serveur web n'est pas du tout sécurisé et donne accès à des données critiques.