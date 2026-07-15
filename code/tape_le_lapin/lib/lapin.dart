import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Tape le 🐇', style: TextStyle(fontSize: 40)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Bonk : x",
                  style: TextStyle(color: Colors.green, fontSize: 30),
                ),
                Text(
                  "Zloop : y",
                  style: TextStyle(color: Colors.red, fontSize: 30),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: null,
                      child: Text("🐹", style: TextStyle(fontSize: 70)),
                    ),
                    ElevatedButton(
                      onPressed: null,
                      child: Text("🐹", style: TextStyle(fontSize: 70)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: null,
                      child: Text("🐹", style: TextStyle(fontSize: 70)),
                    ),
                    ElevatedButton(
                      onPressed: null,
                      child: Text("🐹", style: TextStyle(fontSize: 70)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
