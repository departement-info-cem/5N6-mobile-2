void main() {
  List<int> notes = [90, 67, 23, 55, 77, 85, 65];

  List<int> notesQuiPassent = filtrerNotes(notes, estReussie);
  List<int> notesTopDeLaClasse = filtrerNotes(notes, topDeLaClasse);
  List<int> notesBesoinDeSoutient = filtrerNotes(notes, besoinDeSoutient);

  print(notesQuiPassent); // Affiche [90, 67, 77, 85, 65]
  print(notesTopDeLaClasse); // Affiche [90]
  print(notesBesoinDeSoutient); // Affiche [23, 55]
}

List<int> filtrerNotes(List<int> notes, bool Function(int) condition) {
  List<int> resultat = [];

  for (int note in notes) {
    if (condition(note)) {
      resultat.add(note);
    }
  }

  return resultat;
}

bool estReussie(int note) {
  return note >= 60;
}

bool topDeLaClasse(int note) {
  return note >= 90;
}

bool besoinDeSoutient(int note) {
  return note < 50;
}