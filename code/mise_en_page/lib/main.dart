import 'package:flutter/material.dart';

void main() {
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo mise en page'),
      ),
      body: Column(
        // La plupart des layout pour telephones commencent avec une column
        // TODO #1 jouez entre les differents valeurs de MainAxisAlignment
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  color: Colors.blue,
                  child: const Padding(
                    // Le padding se fait en encapsulant dans le widget Padding
                    padding: EdgeInsets.all(8.0),
                    child: Text("Je prends 2/3"),
                  ),
                ),
              ),
              Expanded(
                // TODO #2 pas forcement necessaire parce que 1 c'est la valeur par defaut
                flex: 1,
                child: MaterialButton(
                  color: Colors.green,
                  onPressed: () {},
                  child: const Text('Super bouton'),
                ),
              )
            ],
          ),
          Container(
            height: 200,
            color: Colors.red,
            margin: const EdgeInsets.all(2),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('salut'),
                        SizedBox(height: 10),
                        Icon(
                          Icons.star,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('yo'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      color: Colors.amberAccent,
                      child: const Column(
                        // TODO #3 changer la valeur ici
                        // conclusion, des qu'un spacer ou un widget avec un flex qui prend tous les pixels
                        // restants le mainAxisalignement ne change plus rien
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Spacer prend de '),
                          Spacer(),
                          Icon(
                            Icons.star,
                          ),
                          // TODO #4 va prendre 4 fois plus des pixels restants qu'un Spacer avec flex de 1
                          Spacer(
                            flex: 4,
                          ),
                          Text('l\'espace'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(7),
            child: TextFormField(
              decoration: InputDecoration(
                // TODO #5 chaque couleur vient avec des nuances accessibles par un index
                fillColor: Colors.blue[50],
                filled: true,
                labelText: 'Indice pour utilisateur',
                contentPadding: const EdgeInsets.all(10),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                  borderSide: BorderSide(color: Colors.redAccent, width: 6.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                  borderSide: BorderSide(color: Colors.blue, width: 3.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // TODO #6 fonction anonyme qui ne fait rien
        onPressed: () {},
        // TODO #7 c'est pour les non-voyants qu'ils sachent ce que fait le bouton
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
