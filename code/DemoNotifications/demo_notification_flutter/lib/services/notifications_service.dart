import 'package:demo_notification/pages/order_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> setupFirebaseMessaging() async {
  // TODO #11 : Initialiser le gestionnaire de notifications
  await flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher')),
    // TODO #15.1 : Réaction au clic sur une notification lorsque l'application est ouverte
    //              Il s'agit de la notification qui a été envoyée au T0D0 #14
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      if (response.payload != null) {
        handleForegroundNotificationClick(response.payload!);
      }
    },
  );

  // TODO #12 : Demander la permission à l'utilisateur pour lui envoyer des notifications
  FirebaseMessaging.instance.requestPermission();

  // TODO #13 : Réception des notifications lorsque l'application est ouverte
  FirebaseMessaging.onMessage.listen(_showNotification);

  // TODO #15.2 : Réaction au clic sur une notification lorsque l'application est en arrière-plan
  FirebaseMessaging.onMessageOpenedApp
      .listen(handleBackgroundNotificationClick);

  // TODO #15.3 : Réaction au clic sur une notification lorsque l'application est complètement fermée
  FirebaseMessaging.instance
      .getInitialMessage()
      .then(handleBackgroundNotificationClick);
}

Future<void> _showNotification(RemoteMessage message) async {
  // TODO #14 : Par défaut, quand l'application est ouverte, les notifications
  //            ne sont pas affichées. Il faut donc les afficher manuellement.
  await flutterLocalNotificationsPlugin.show(
    message.notification.hashCode,
    message.notification?.title ?? 'Notification',
    message.notification?.body ?? 'Vous avez reçu une notification.',
    NotificationDetails(
        android: AndroidNotificationDetails(
      'id_du_type_de_notifications',
      message.notification?.title ?? 'Notification',
      channelDescription:
          message.notification?.body ?? 'Vous avez reçu une notification.',
      importance: Importance.high,
      priority: Priority.high,
    )),
    // TODO #14.1 : On met l'information à traiter dans le payload
    payload: message.data['OrderContent'] ?? 'default',
  );
}

// TODO #16.1 : Ce qu'on fait quand on a cliqué sur une notification en arrière-plan
//              ou quand l'application était complètement fermée
void handleBackgroundNotificationClick(RemoteMessage? message) {
  if (message == null) return;

  if (message.data['OrderContent'] != null) {
    Navigator.push(
      // TODO #17 : Le navigator key permet d'accéder au contexte depuis n'importe où
      navigatorKey.currentContext!,
      MaterialPageRoute(
        // Ouvrir la page OrderPage avec le les données qui avaient été définis avec
        // la propritété "data" sur le serveur
        builder: (context) => OrderPage(
          orderContent: message.data["OrderContent"],
        ),
      ),
    );
  }
}

// TODO #16.2 : Ce qu'on fait quand on a cliqué sur une notification alors que
//              l'application était ouverte
Future<void> handleForegroundNotificationClick(String payload) async {
  await Navigator.push(
    // TODO #17 : Le navigator key permet d'accéder au contexte depuis n'importe où
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => OrderPage(
        orderContent: payload,
      ),
    ),
  );
}
