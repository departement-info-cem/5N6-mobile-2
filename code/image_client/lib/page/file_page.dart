import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FilePage extends StatefulWidget {
  const FilePage({super.key});

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    // TODO #2b : Essayez de changer ImageSource.gallery pour ImageSource.camera .
    // Qu'est-ce que c'est que cet espèce de bonhome / maison?!
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() {
      _selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page File')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_selectedImage != null)
              // TODO #2c : Afficher l'image sélectionnée dans un widget Image.file .
              Image.file(
                File(_selectedImage!.path),
                width: 220,
                height: 220,
                // TODO #2d : Essayez les différents BoxFit (cover, contain, fill, fitWidth, fitHeight, none, scaleDown).
                // Prenez aussi le temps de lire la documentation que l'intellisense (Ctrl + Espace) vous propose sur BoxFit.
                fit: BoxFit.cover,
              )
            else
              const Text(
                'Aucune image sélectionnée',
                style: TextStyle(fontSize: 16),
              ),
            const SizedBox(height: 20),

            ElevatedButton(
              // TODO #2a : Au click sur le bouton, ouvrir la galerie pour choisir une image.
              onPressed: _pickImage,
              child: const Text('Choisir une image'),
            ),
          ],
        ),
      ),
    );
  }
}
