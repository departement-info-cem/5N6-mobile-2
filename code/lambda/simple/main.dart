void main() {
  List<int> notes = [90, 67, 23, 55, 77, 85, 65];
  List<int> notesQuiPassent = filtrerNotes(notes, 60);

  print(notesQuiPassent); // Affiche [90, 67, 77, 85, 65]
}

List<int> filtrerNotes(List<int> notes, int seuil) {
  List<int> resultat = [];

  for (int note in notes) {
    if (note >= seuil) {
      resultat.add(note);
    }
  }

  return resultat;
}
