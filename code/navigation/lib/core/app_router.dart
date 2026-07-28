import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/page/detail.dart';
import 'package:navigation/page/home.dart';

// TODO A3.1 : Cette propriété est optionnelle.
// Elle permet de naviguer dans sans avoir à être dans un widget
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

// TODO A3.2 : Toutes les routes sont définies dans un fichier central
final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: "/",
  // TODO A3.3 : Mode debug pour afficher les transitions de routes dans la console
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: "/",
      name:
          'home', // TODO A3.4 : Le nom permet de naviguer avec context.goNamed()
      builder: (context, state) => const HomePage(),
      routes: [
        // TODO A3.5 :
        // Déclarer 'detail' comme une sous-route permet de gérer
        // le bouton "retour" nativement dans l'AppBar, pour faire comme pop dans le Navigator
        GoRoute(
          path: '/detail/:id',
          name: 'detail',
          builder: (context, state) {
            // TODO A3.6 : On extrait le paramètre id de l'url pour le donner à DetailPage, qui en a besoin
            final id = state.pathParameters['id'];
            return DetailPage(id: int.parse(id!));
          },
        ),
      ],
    ),
  ],
  // TODO A3.7 : Exemple de gestion d'erreur 404, surtout utile en mode web
  errorBuilder: (context, state) =>
      Scaffold(body: Center(child: Text('Route introuvable : ${state.uri}'))),
);
