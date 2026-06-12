import 'package:flutter/material.dart';

import '../models/cat.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  final List<Cat> _cats = [
    Cat(id:1, name: "Lion Tiger", description: "Imposant et dangereux félin" ,image: "https://animalcarecentersmyrna.com/wp-content/uploads/2020/11/interesting-facts-cats.jpeg"),
    Cat(id:2, name: "Stiv", description: "Diva et dramatique" ,image: "https://media.istockphoto.com/id/1281804798/photo/very-closeup-view-of-amazing-domestic-pet-in-mirror-round-fashion-sunglasses-is-isolated-on.webp?b=1&s=170667a&w=0&k=20&c=4CLWHzcFeku9olx0np2htie2cOdxWamO-6lJc-Co8Vc="),
    Cat(id:3, name: "Alexandre", description: "Perdu" ,image: "https://media.istockphoto.com/id/1372144730/photo/cool-fluffy-cat-wearing-sunglasses-looking-up-at-copy-space-portrait-on-red-background.jpg?s=612x612&w=0&k=20&c=Ca_RjsBxYzyLNfBhn-7U-GfIUS3aJse3Ar77sJHohGo="),
    Cat(id:4, name: "Lionnel", description: "Roi du disco" ,image: "https://media.istockphoto.com/id/1171193130/video/portrait-of-disco-furry-cat-in-fashion-eyeglasses-on-studio-neon-shining-wall-luxurious.jpg?s=640x640&k=20&c=_tYNhxEeqxNGtRL5H7AjODDwDVCw1xND8nFMM8owluc="),
    Cat(id:5, name: "Sa Majesté Fluffy Mcfluff", description: "Trop cool" ,image: "https://media.istockphoto.com/id/1227017125/photo/cool-cat-sunglasses.webp?b=1&s=170667a&w=0&k=20&c=2U0SEf5HqsXYAYVsdctTqH2h5gBxWfsLYu7VcNgOxN8="),
    Cat(id:6, name: "Caramel", description: "Chill et relax" ,image: "https://static.vecteezy.com/system/resources/thumbnails/022/678/486/small_2x/funny-studio-shot-of-cool-cat-wearing-sunglasses-on-yellow-background-with-copy-space-generative-ai-photo.jpg"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: const Text("Extraire les widgets"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        elevation: 10,
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                  'Mes chats',
                  style: Theme.of(context).textTheme.headlineLarge
              ),
            ),
            Card(
              child: MaterialButton(
                onPressed: () {},
                child: const ListTile(
                  leading: Icon(
                      Icons.add,
                      size: 56.0
                  ),
                  title: Text('Ajouter un chat'),
                  subtitle: Text('Toujours plus de chats'),
                ),
              ),
            ),
            Card(
              child: MaterialButton(
                onPressed: () {},
                child: const ListTile(
                  leading: Icon(
                      Icons.pets,
                      size: 56.0
                  ),
                  title: Text('Accueil'),
                  subtitle: Text('Avec une liste de chats'),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(0.0),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.0, 0.7),
                end: Alignment(0.9, -0.1),
                colors: [
                  Color(0xFFffffff),
                  Color(0xFF266669),
                  Color(0xFF6e8f92),
                ],
                stops: [
                  0.1,
                  1.0,
                  0.5,
                ],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 120,
                child: Stack(
                  children: [
                    Material(
                      elevation: 20,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: const Color(0xFF6e8f92),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipOval(
                              child:
                              Image.network(
                                'https://avatars.githubusercontent.com/u/11493174',
                                fit:BoxFit.fill,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Expanded(
                            flex: 8,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Profession",
                                    style: TextStyle(fontSize:32.0,
                                        color: Color(0xFF204f4f),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Roboto"),
                                  ),

                                  Text(
                                    "Passionné des chats",
                                    style: TextStyle(fontSize:24.0,
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "Roboto"),
                                  ),
                                ]
                            ),
                          )
                        ]

                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    const Text(
                      "Ma collection de chats",
                      style: TextStyle(fontSize:32.0,
                          color: Color(0xFF204f4f),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Roboto"),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 220,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(_cats[0].name),
                                    subtitle: Text(
                                      _cats[0].description,
                                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ),
                                  Image.network(_cats[0].image),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 220,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(_cats[1].name),
                                    subtitle: Text(
                                      _cats[1].description,
                                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ),
                                  Image.network(_cats[1].image),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 220,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(_cats[2].name),
                                    subtitle: Text(
                                      _cats[2].description,
                                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ),
                                  Image.network(_cats[2].image),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 220,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(_cats[3].name),
                                    subtitle: Text(
                                      _cats[3].description,
                                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ),
                                  Image.network(_cats[3].image),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 220,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(_cats[4].name),
                                    subtitle: Text(
                                      _cats[4].description,
                                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ),
                                  Image.network(_cats[4].image),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 220,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(_cats[5].name),
                                    subtitle: Text(
                                      _cats[5].description,
                                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ),
                                  Image.network(_cats[5].image),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        child: const Icon(Icons.add),
      ),
    );
  }
}
