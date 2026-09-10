# 💇 5.1B – refactorisation

## Objectifs 🎯

Appliquer les concepts d'extraction et de structuration sur votre propre base de code pour en améliorer la lisibilité et la maintenabilité.

## À faire 🛠️

Ce que vous venez d'accomplir dans l'exercice précédent s'appelle une **refactorisation**. Il s'agit de modifier la structure interne du code (pour le rendre plus propre, plus performant ou plus facile à lire) sans en changer le comportement externe.

1. **L'analyse** : Ouvrez le code de votre projet actuel. Repérez les méthodes build qui sont devenues trop longues, trop imbriquées ou difficiles à lire du premier coup d'oeil.
2. **Le grand nettoyage** : Refactorisez votre code en appliquant les mêmes principes qu'à l'exercice précédent :
   - Extrayez les morceaux d'interface indépendants ou répétitifs dans de nouveaux **Widgets** (classes).
   - Déplacez certaines constructions logiques dans des **méthodes privées**.
   - (Optionnel) Si un fichier devient trop gros, n'hésitez pas à déplacer vos nouveaux widgets dans des fichiers séparés !
3. **La validation** : Lancez votre application. Visuellement et fonctionnellement, rien ne devrait avoir changé. Si l'application se comporte exactement de la même manière, mais que le code est plus beau : mission accomplie !

:::info
Le code est lu beaucoup plus souvent qu'il n'est écrit. Pensez à votre "vous" du futur ou à vos collègues : n'attendez pas qu'un fichier atteigne 1000 lignes pour commencer à le structurer !
:::