import 'package:flutter/material.dart';
import 'package:navigation/app_config.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/page/home.dart';

class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Détails : $id')),
      body: Center(
        child: Column(
          children: [_navigateButton(context), _popButton(context)],
        ),
      ),
    );
  }

  ElevatedButton _navigateButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (AppConfig.useNavigator) {
          // TODO B3 : Naviguer vers la page home avec le Navigator
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => HomePage()));
        } else {
          // TODO A5 : Naviguer vers la page home avec le Router
          context.go('/');
        }
      },
      child: const Text('Retourner à l\'accueil'),
    );
  }

  ElevatedButton _popButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (AppConfig.useNavigator) {
          // TODO B4 : Retourne aussi à la page Home, mais en dépilant.
          // Quelle est la différence, sur l'écran, entre ce que fait ce bouton vs l'autre?
          Navigator.of(context).pop();
        } else {
          // TODO A6 : dépiler avec un Router.
          context.pop();
        }
      },
      child: const Text('Dépiler la pile'),
    );
  }
}
