import 'package:firestore_typed/pages/ajout_etudiant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('affiche une erreur du service pour un nom trop court',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: AjoutEtudiantPage()),
    );

    await tester.enterText(find.byType(TextField).at(0), 'A');
    await tester.enterText(find.byType(TextField).at(1), '1234567');
    await tester.tap(find.text('Enregistrer'));
    await tester.pump();

    expect(
      find.text('Le nom doit contenir au moins deux caractères.'),
      findsOneWidget,
    );
  });
}
