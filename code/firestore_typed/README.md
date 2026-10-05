# firestore_typed

Démo d'accès à Firestore avec des objets typés plutôt que des
`Map<String, dynamic>`.

Le fichier `lib/service.dart` centralise la collection typée, les requêtes et
la validation avant écriture. L'exemple gère des étudiants dont le nom doit
contenir au moins deux caractères et dont le matricule est composé de
exactement sept chiffres. Il conserve aussi l'horodatage serveur de création.

Le fichier `firestore.rules` applique les mêmes contraintes côté Firestore.
Publiez ces règles dans votre projet Firebase avant de faire la démonstration;
la validation Dart améliore l'expérience utilisateur, mais les règles
protègent la base de données pour tous les clients.
