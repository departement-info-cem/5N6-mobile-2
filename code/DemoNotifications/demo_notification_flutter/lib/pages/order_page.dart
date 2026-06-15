import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String orderContent;

  const OrderPage({super.key, required this.orderContent});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Commande'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
                'Voici le détail de la commande de ${widget.orderContent}')),
      ),
    );
  }
}
