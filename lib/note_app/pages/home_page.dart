import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/note_app/models/note_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import 'editing_note_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NoteData>(context, listen: false).initilaizeNotes();
  }

  // TODO: Create a new note

  void createNewNote() {
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;

    // TODO: Create a blank note

    Note newNote = Note(id: id, text: '');

    // TODO: Go to the next note

    goToNotePage(newNote, true);
  }

  void goToNotePage(Note note, bool isNewNote) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditingNotePage(
                  isNewNote: isNewNote,
                  note: note,
                )));
  }

  // TODO: Delete Note pages

  void deleteNote(Note note) {
    Provider.of<NoteData>(context, listen: false).deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: createNewNote,
          elevation: 0,
          backgroundColor: CupertinoColors.systemBackground,
          child: const Icon(
            Icons.add,
          ),
        ),
        /* appBar: AppBar(
          title: const Text('Note Application'),
        ), */
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    'Notes',
                    style: GoogleFonts.lato()
                        .copyWith(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                value.getAllNotes().isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Center(
                            child: Text(
                          'Nothing here...',
                          style: TextStyle(color: Colors.grey.shade400),
                        )),
                      )
                    : CupertinoListSection.insetGrouped(
                        children: List.generate(
                          value.getAllNotes().length,
                          (index) => CupertinoListTile(
                            title: Text(value.getAllNotes()[index].text,maxLines:1,),
                            onTap: () =>
                                goToNotePage(value.getAllNotes()[index], false),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => deleteNote(value.getAllNotes()[index]),
                            ),
                          ),
                        ),
                      )
              ]),
        ),
      ),
    );
  }
}
