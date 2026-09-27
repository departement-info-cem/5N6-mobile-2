import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final String apiKey = dotenv.get('REST_COUNTRIES_API_KEY');
    final int existePas = dotenv.getInt('J_EXISTE_PAS', fallback: 42);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Secrets"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            Text(
              'La clé d\'API de REST Coutries est $apiKey',
              textAlign: .center,
            ),
            Text(existePas.toString(), style: TextStyle(fontSize: 42)),
          ],
        ),
      ),
    );
  }
}
