// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/note_app/models/note_data.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';

// ignore: must_be_immutable
class EditingNotePage extends StatefulWidget {
  Note note;
  bool isNewNote;
  EditingNotePage({
    super.key,
    required this.note,
    required this.isNewNote,
  });

  @override
  // ignore: library_private_types_in_public_api
  _EditingNotePageState createState() => _EditingNotePageState();
}

class _EditingNotePageState extends State<EditingNotePage> {
  QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
    loadExistingNote();
  }

  void loadExistingNote() {
    final doc = Document()..insert(0, widget.note.text);
    setState(() {
      _controller = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  // add new note

  // TODO: update existing note

  void addNewNote() {
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;
    // TODO: get text from editor

    String text = _controller.document.toPlainText();

    // TODO: update note

    Provider.of<NoteData>(context, listen: false)
        .addNewNoute(Note(id: id, text: text));
  }

  void updateNote() {
    String text = _controller.document.toPlainText();

    Provider.of<NoteData>(context, listen: false).updateNote(widget.note, text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        appBar: AppBar(
          backgroundColor: CupertinoColors.systemGroupedBackground,
          title: Text(
            widget.isNewNote? 'New Note' : 'Edit Note',
            style: const TextStyle(color: CupertinoColors.label),
          ),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              if (widget.isNewNote && !_controller.document.isEmpty()) {
                addNewNote();
              } else {
                updateNote();
              }
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              // toolbar
              QuillToolbar.simple(
                configurations: QuillSimpleToolbarConfigurations(
                  controller: _controller,
                  showFontFamily: false,
                  showDividers: false,
                  showFontSize: false,
                  showColorButton: false,
                  showIndent: false,
                  showClearFormat: false,
                  showCodeBlock: false,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(25),
                  child: QuillEditor.basic(
                      focusNode: FocusNode(
                        debugLabel: 'debug-label',
                        canRequestFocus: true,
                      ),
                      configurations: QuillEditorConfigurations(
                          controller: _controller, readOnly: false)),
                ),
              )

              // editor
            ],
          ),
        ));
  }
}
