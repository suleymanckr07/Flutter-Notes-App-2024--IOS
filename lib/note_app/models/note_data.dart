import 'package:flutter/material.dart';
import 'package:flutter_application_1/note_app/database/hive_database.dart';
import 'package:flutter_application_1/note_app/models/note.dart';

class NoteData extends ChangeNotifier {
// Hive database 

final db = HiveDatabase();

  // TODO: owerall list of notes

  List<Note> allNotes = [Note(id: 0, text: 'Firs notes')];

  // TODO: get all notes

  List<Note> getAllNotes() {
    return allNotes;
  }

  // İnitialize list

  void initilaizeNotes(){
    allNotes = db.loadNotes();
  }

  // TODO: add note

  void addNewNoute(Note note) {
    allNotes.add(note);
    notifyListeners();
  }

  // TODO: update note

  void updateNote(Note note, String text) {
    // go true List of all notes

    for (int i = 0; i < allNotes.length; i++) {
      if (allNotes[i].id == note.id) {
        allNotes[i].text = text;
      }
    }
    notifyListeners();
  }

  // TODO: delete note

  void deleteNote(Note note) {
    allNotes.remove(note);
    notifyListeners();
  }
}
