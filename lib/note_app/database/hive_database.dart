import 'package:flutter_application_1/note_app/models/note.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
// reference our hive box

  final _mybox = Hive.box('note_database');

// load notes

  List<Note> loadNotes() {
    List<Note> savedNotesFormatted = [];

// if there exists a note return that otherwise return empty list

    if (_mybox.get("ALL_NOTES") != null) {
      List<dynamic> savedNotes = _mybox.get("ALL_NOTES");
      for (int i = 0; i < savedNotes.length; i++) {
        // Create individual note

        Note individualNote =
            Note(id: savedNotes[i][0], text: savedNotes[i][1]);

        // add to the list

        savedNotesFormatted.add(individualNote);
      }
    } else {
      savedNotesFormatted.add(Note(id: 0, text: 'First note'));
    }
    return savedNotesFormatted;
  }

  void saveNotes(List<Note> allNotes) {
    List<List<dynamic>> allNotesFormatted = [];

    for (var note in allNotes) {
      int id = note.id;
      String text = note.text;
      allNotesFormatted.add([id, text]);
    }
    _mybox.put("ALL_NOTES", allNotesFormatted);
  }
}
