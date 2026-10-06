import 'dart:io';
import 'dart:io' as io;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() {
      _selectedImage = image;
    });
  }

  Future<void> _sendImage() async {
    if (_selectedImage != null) {
      FirebaseStorage.instance
          .ref()
          .child(
            "id_utilisateur",
          ) // Remplacer par l'id de l'utilisateur connecté
          .child(
            "photos_profil",
          ) // On pourrait avoir plusieurs "dossiers" par type d'image à stocker.
          .putFile(io.File(_selectedImage!.path));
    } else {
      const snackBar = SnackBar(
        content: Text("Vous devez d'abord sélectionner une image!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Firebase storage demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(
              onPressed: () => _pickImage(),
              child: Text('Choisir une image'),
            ),
            SizedBox(height: 16),
            _image(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _sendImage(),
              child: Text("Envoyer l'image"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    if (_selectedImage != null) {
      return Image.file(
        File(_selectedImage!.path),
        width: 220,
        height: 220,
        fit: BoxFit.cover,
      );
    } else {
      return const Text(
        'Aucune image sélectionnée',
        style: TextStyle(fontSize: 16),
      );
    }
  }
}
