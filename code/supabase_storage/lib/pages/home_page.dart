import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final picker = ImagePicker();

  // on met le fichier dans l'etat pour l'afficher dans la page
  File? _imageFile;
  String? _publicUrl;

  _sendPicture(XFile xfile) async {
    final supabase = Supabase.instance.client;

    // Attention, si le bucket n'existe pas, vous allez avoir une erreur StorageException (StorageException(message: Bucket not found, statusCode: 404, error: Bucket not found))
    String bucketid = "demo-supabase";

    //TODO doc: https://supabase.com/docs/reference/dart/storage-from-upload
    final String fullPath = await supabase.storage.from(bucketid).upload(
        //TODO Mettre un nom unique
        xfile.name,
        File(xfile.path));

    //TODO doc: https://supabase.com/docs/reference/dart/storage-from-getpublicurl
    _publicUrl = supabase.storage.from(bucketid).getPublicUrl(xfile.name);
  }

  Future _getImage() async {
    print("ouverture du selecteur d'image");
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print("l'image a ete choisie ${pickedFile.path}");
      _imageFile = File(pickedFile.path);
      setState(() {});

      await _sendPicture(pickedFile);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('supabase_storage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'appui sur le bouton en bas pour choisir une image à envoyer',
          ),
          _sectionLocale(),
          _sectionSupabase()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _sectionLocale() {
    if (_imageFile == null) {
      return Container(
        color: Colors.red,
        height: 50,
      );
    } else {
      return Column(
        children: [
          const Text("Cette image est sur votre téléphone"),
          SizedBox(
            height: 250,
            child: Image.file(_imageFile!),
          ),
        ],
      );
    }
  }

  Widget _sectionSupabase() {
    if (_publicUrl == null) {
      return Container(
        color: Colors.red,
        height: 50,
      );
    } else {
      return Column(
        children: [
          const Text("Cette image provient de Supabase :"),
          SizedBox(
            height: 250,
            child: Image.network(_publicUrl!),
          ),
        ],
      );
    }
  }
}
