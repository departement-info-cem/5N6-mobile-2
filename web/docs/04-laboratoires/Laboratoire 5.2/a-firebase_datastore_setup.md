# 📦 5.2B – firebase_datastore_setup

## Objectif 🎯

Apprendre à structurer et gérer des données avec Firestore (la base de données NoSQL orientée documents de Firebase).

## À faire 🛠️

### Prérequis

Avoir complété la configuration Firebase de base avec firebase_core et google_sign_in.


### Étape 1 - Installation de cloud_firestore

Valider que la librairie cliente est installée.

```bash
flutter pub add cloud_firestore
flutterfire configure
```

Faites un **COMMIT PUSH**.

### Étape 2 - Création d'une base de données Firestore

- Allez dans la console Firebase
- Sélectionnez votre projet
- Dans le panneau à gauche, cliquez sur **Firestore Database**
- Cliquez sur **Créer une base de données**
- Sélectionnez le **mode test** (permet de lire/écrire sans règles de sécurité)
- Continuez les étapes suivantes
- Cliquez sur **Créer**

### Étape 3 - Tester l'accès à Firestore 

Pour vérifier que tout fonctionne correctement:

- Quelque part dans votre application, ajoutez un bouton
- Avec le code suivant
- Quand on cliquera dessus cela devrait créer une entrée

```dart
MaterialButton(
  onPressed: () {
    final db = FirebaseFirestore.instance;
    final user = <String, dynamic>{
      "first": "Ada",
      "last": "Lovelace",
      "born": 1815,
    };
    db
            .collection("users")
            .add(user)
            .then(
    (DocumentReference doc) =>
    print('DocumentSnapshot added with ID: ${doc.id}'),
    );
  },
  child: const Text("Test ajout firestore"),
),
```

- Lancez l'application
- Appuyez sur le bouton créé
- Allez à la console Firebase dans le volet **Firestore**
- Vous devriez voir les données apparaître!

**COMMIT et PUSH**.

### Étape 4 - Comprendre la structure Firestore

Firestore est **orienté documents**, pas relationnel comme SQL:

- **Collections**: Conteneurs de documents (comme des tables)
- **Documents**: Objets JSON avec un ID unique
- **Subcollections**: Collections imbriquées dans un document
- **Champs**: Propriétés des documents

Exemple de structure:
```
users/
  ├── user1 (document)
  │   ├── name: "Alice"
  │   ├── email: "alice@example.com"
  │   └── posts/ (subcollection)
  │       ├── post1
  │       └── post2
  └── user2 (document)
```

### Étape 5 - Créer une collection manuellement

Dans la console Firestore:
- Cliquez sur **+ Créer une collection**
- Nommez-la `users`
- Cliquez sur **Suivant**
- Cliquez sur **Ajouter un document** et remplissez manuellement:
  - ID: `user1` (personnalisé)
  - Champs:
    - `name` (string): "Alice"
    - `email` (string): "alice@example.com"
    - `age` (number): 25

Ajoutez quelques documents à votre collection pour tester.

### Étape 6 - Accéder aux données en Flutter

Dans un StatefulWidget, créez une méthode pour récupérer les données:

```dart
Future<List<Map<String, dynamic>>> getUsers() async {
  final db = FirebaseFirestore.instance;
  final snapshot = await db.collection('users').get();
  
  return snapshot.docs.map((doc) => doc.data()).toList();
}
```

Dans la UI, utilisez un FutureBuilder pour afficher les données:

```dart
FutureBuilder<List<Map<String, dynamic>>>(
  future: getUsers(),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return Text('Erreur: ${snapshot.error}');
    }
    
    if (!snapshot.hasData) {
      return Text('Chargement...');
    }
    
    final users = snapshot.data!;
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users[index]['name']),
          subtitle: Text(users[index]['email']),
        );
      },
    );
  },
)
```

Testez l'affichage de vos données.

Faites un **COMMIT PUSH**.

### Étape 6 - Ajouter des données en Flutter

Créez une méthode pour ajouter un nouvel utilisateur:

```dart
Future<void> addUser(String name, String email, int age) async {
  final db = FirebaseFirestore.instance;
  
  await db.collection('users').add({
    'name': name,
    'email': email,
    'age': age,
  });
}
```

Utilisez `add()` pour générer un ID automatiquement, ou `set()` si vous avez un ID spécifique:

```dart
await db.collection('users').doc('user123').set({
  'name': 'Bob',
  'email': 'bob@example.com',
});
```

Ajoutez un bouton pour insérer des données et vérifiez dans la console Firebase.

Faites un **COMMIT PUSH**.

### Étape 7 - Utiliser StreamBuilder pour les mises à jour en temps réel

Au lieu de récupérer les données une seule fois, utilisez `snapshots()` pour écouter les changements:

```dart
StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection('users').snapshots(),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return Text('Erreur: ${snapshot.error}');
    }
    
    if (!snapshot.hasData) {
      return Text('Chargement...');
    }
    
    final users = snapshot.data!.docs;
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index].data() as Map<String, dynamic>;
        return ListTile(
          title: Text(user['name']),
          subtitle: Text(user['email']),
        );
      },
    );
  },
)
```

Testez en ajoutant des documents dans la console Firebase — ils apparaîtront en temps réel!

### Étape 8 - Mettre à jour et supprimer

Pour mettre à jour un document:

```dart
await db.collection('users').doc('user1').update({
  'age': 26,
});
```

Pour supprimer un document:

```dart
await db.collection('users').doc('user1').delete();
```

Ajoutez des boutons pour tester ces opérations.

Faites un **COMMIT PUSH**.

### Étape 9 - Filtrer et trier les données

Vous pouvez filtrer les résultats avec `where()`:

```dart
final query = db
  .collection('users')
  .where('age', isGreaterThan: 18)
  .orderBy('age', descending: true);

final snapshot = await query.get();
```

Testez différentes requêtes pour comprendre le fonctionnement.

### Points clés à retenir

- ✅ Firestore est NoSQL et orienté documents
- ✅ Les collections sont flexibles (pas de schéma rigide)
- ✅ Utilisez `StreamBuilder` pour les mises à jour en temps réel
- ✅ Chaque requête à Firestore coûte des "lectures" (attention aux quotas gratuits!)
- ✅ Structurez vos données intelligemment (denormalization vs sous-collections)
