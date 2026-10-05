import 'package:firestore_typed/model/etudiant.dart';
import 'package:firestore_typed/service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('validerEtudiant', () {
    test('accepte un nom et un matricule valides', () {
      expect(
        () => validerEtudiant(
          const Etudiant(nom: 'Ada Lovelace', matricule: '1234567'),
        ),
        returnsNormally,
      );
    });

    test('refuse un nom de moins de deux caractères', () {
      expect(
        () => validerEtudiant(
          const Etudiant(nom: 'A', matricule: '1234567'),
        ),
        throwsA(isA<NomCourtException>()),
      );
    });

    test('refuse un matricule qui ne contient pas exactement sept chiffres',
        () {
      expect(
        () => validerEtudiant(
          const Etudiant(nom: 'Ada Lovelace', matricule: '12345A7'),
        ),
        throwsA(isA<MatriculeSeptException>()),
      );
    });
  });
}
