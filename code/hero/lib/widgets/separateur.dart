import 'package:flutter/material.dart';

class Separateur extends StatelessWidget {
  const Separateur({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      thickness: 1.0,
      indent: 16.0,
      endIndent: 16.0,
    );
  }
}
