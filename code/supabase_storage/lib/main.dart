import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://fwidkqfiwkzomtnqmzgh.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ3aWRrcWZpd2t6b210bnFtemdoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIwNTE5NTUsImV4cCI6MjA0NzYyNzk1NX0.Z2r-OlsvUvws8AS0rpSMerLk_0T60GdtyRR4yTqstPc';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //TODO Initialize like Firebase doc: https://supabase.com/docs/reference/dart/initializing
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'supabase demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final picker = ImagePicker();

  // on met le fichier dans l'etat pour l'afficher dans la page
  var _imageFile;
  var _publicUrl;

  sendPicture(XFile xfile) async {

    final supabase = Supabase.instance.client;

    String bucketid = "Supa-bucket";

    try {
      await supabase
        .storage
        .createBucket(bucketid, BucketOptions(public: true));
    } on StorageException catch(e) { 
      
      if(e.error == "Duplicate") {
        // Le bucket existe déjà
        print(e);
      }

    }

    //TODO doc: https://supabase.com/docs/reference/dart/storage-from-upload
    final String fullPath = await supabase
      .storage
      .from(bucketid)
      .upload(
        //TODO Mettre un nom unique
        xfile.name,
        File(xfile.path)
      );

    //TODO doc: https://supabase.com/docs/reference/dart/storage-from-getpublicurl
    _publicUrl = supabase
        .storage
        .from(bucketid)
        .getPublicUrl(xfile.name);
  }

  Future getImage() async {
    print("ouverture du selecteur d'image");
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print("l'image a ete choisie ${pickedFile.path}");
      _imageFile = File(pickedFile.path);
      setState(() {});

      await sendPicture(pickedFile);
      setState(() { });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('envoi image'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'appui sur le bouton en bas pour choisir une image à envoyer',
          ),
          _imageFile == null
              ? Container(
                  color: Colors.red,
                  height: 50,
                )
              : SizedBox(
                  height: 250,
                  child: Image.file(_imageFile),
                ),
          _publicUrl == null
              ? Container(
            color: Colors.red,
            height: 50,
          )
              : SizedBox(
            height: 250,
            child: Image.network(_publicUrl),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
