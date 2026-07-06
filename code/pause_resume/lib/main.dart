import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pause et Résume',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pause et Résume'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final stopwatch = Stopwatch();

  @override
  void initState() {
    super.initState();
    // TODO 1 On doit ajouter un observer à la création du widget
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO 2 On doit retirer l'observer à la destruction du widget
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO 3 Les changements d'état de l'application sont gérés ici
    if (state == AppLifecycleState.resumed) {
      stopwatch.stop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'On est parti pendant ${stopwatch.elapsed.inSeconds} secondes'),
        ),
      );
      stopwatch.reset();
    } else if (state == AppLifecycleState.paused) {
      stopwatch.start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
    ));
  }
}
