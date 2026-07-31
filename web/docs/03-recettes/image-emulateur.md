# Image sur un émulateur 🖼️

## Ajouter l'image

Pour tester l'accès de votre application à des images, vous devez avoir des images sur votre appareil. Si vous tester avec un émulateur, il y a un moyen plus rapide que d'ouvrir le navigateur de l'émulateur.

1. Téléchargez une image sur votre poste. Celle-ci fera l'affaire :

![Photo du PFK Kid, tel que vu dans le film Pea Soup de Pierre Falardeau](./_image-emulateur/le-pfk-kid.jpeg)

2. Dans l'explorateur de fichiers, sélectionnez l'image qui vous intéresse, et faites un *drag and drop* sur l'émulateur pendant qu'il s'exécute.
3. La photo se retrouve automagiquement sur l'émulateur, dans `sdcard/Download`.
4. La prochaine étape que vous cherchez est probablement [Accéder à l'image avec le file picker](#avec-le-file-picker).

## Accéder à l'image

### Avec le file picker

À l'ouverture du file picker, vous risquez d'être déçus. L'image téléversée sur l'émulateur n'apparaitra pas directement. Vous devez :

1. Appuyer sur ![capture d'écran des trois petits points dans l'interface de sélection d'image](./_image-emulateur/trois-points.png) en haut à droite de l'interface.
2. Sélectionnez **Browse** (en anglais) ou **Parcourir** (en Français)
3. Cliquer sur sur ![capture d'écran du menu hamburger au haut à gauche](./_image-emulateur/hamburger.png).
4. Sélectionnez **Downloads** (en anglais) ou **Téléchargements** (en français).
5. La ou les photos téléchargées devraient s'afficher.

<center>
<Image alt="Capture d'écran de la section téléchargement avec la photo préalablement téléversée présente" img={require('./_image-emulateur/telechargements.png')} width="300" />
</center>

### Dans le système de fichier

L'image devrait simplement apparaitre en ouvrant l'application **Files** (en anglais) ou **Fichiers** (en français).