import 'package:flutter/material.dart';
import 'package:image_client/page/asset_page.dart';
import 'package:image_client/page/file_page.dart';
import 'package:image_client/page/network_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Accueil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          crossAxisCount: 2,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _assetButton(context),
            _fileButton(context),
            _networkButton(context),
          ],
        ),
      ),
    );
  }

  ElevatedButton _assetButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (context) => const AssetPage()),
        );
      },
      child: const Text(
        "Asset 🐦",
        style: TextStyle(fontSize: 32.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  ElevatedButton _fileButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute<void>(builder: (context) => const FilePage()));
      },
      child: const Text(
        "File 📱",
        style: TextStyle(fontSize: 32.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  ElevatedButton _networkButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (context) => const NetworkPage()),
        );
      },
      child: const Text(
        "Network 🌐",
        style: TextStyle(fontSize: 32.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
