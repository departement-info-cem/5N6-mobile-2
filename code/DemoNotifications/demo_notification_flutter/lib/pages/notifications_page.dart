import 'package:demo_notification/models/dtos/order_request.dart';
import 'package:demo_notification/services/order_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final orderContentController = TextEditingController(text: 'Pizza');

  _commander() async {
    // TODO #2 : Récupérer le token de l'appareil
    // Ce token est unique à votre appareil, et permet au serveur d'envoyer
    // des notifications spécifiques à votre appareil
    // Le token est susceptible de changer, il est donc recommandé de s'inscrire
    // aux changements de token. Voir la documentation pour plus d'informations
    // https://firebase.flutter.dev/docs/messaging/server-integration/#saving-tokens
    String? token = await FirebaseMessaging.instance.getToken();
    String orderContent = orderContentController.text;

    OrderRequest request = OrderRequest(orderContent: orderContent, deviceToken: token!);
    try {
      // TODO #3 : Envoyer la commande au serveur.
      // Le serveur va attendre 5 secondes, puis va envoyer une notification
      // Le prochain TODO est sur le code du serveur!
      await order(request);
      print('Commande effectuée');
    } catch (e) {
      print('Erreur lors de la commande: $e');
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Démo des Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _orderTextField(),
              const SizedBox(height: 8),
              _orderButton()
            ],
          ),
        ),
      ),
    );
  }

  TextField _orderTextField() {
    return TextField(
      controller: orderContentController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Item à commander',
      ),
    );
  }

  ElevatedButton _orderButton() {
    return ElevatedButton(
        onPressed: _commander, child: const Text("Commander"));
  }
}
