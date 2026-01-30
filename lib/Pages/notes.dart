import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_v1/Utilities/Notes%20Utilities/note_viewer.dart';
import 'package:notes_v1/Utilities/Notes%20Utilities/notes_dialogue_box.dart';
import 'package:notes_v1/Utilities/Notes%20Utilities/notes_tile.dart';
import 'package:notes_v1/data/notes_database.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  NotesDatabase db = NotesDatabase();

  // Track the current note index being edited

  @override
  void initState() {
    // if this is the first time ever opening the app, then create default data
    if (_myBox.get('NOTES') == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

  //text controller
  final _notename = TextEditingController();
  final _note = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Color _selectedCategory = Colors.blue;

  //save new note
  void saveNewNote() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        db.notes.add([_notename.text, _note.text, _selectedCategory]);
        _notename.clear();
        _note.clear();
        _selectedCategory = Colors.blue; // Reset to default
      });
      Navigator.of(context).pop();
      db.updateDatabase();
    }
  }

  //save edited note
  void editedNote(int index) {
    setState(() {
      db.notes[index] = [_notename.text, _note.text, _selectedCategory];
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  // Category change callback
  void onCategoryChanged(Color category) {
    setState(() {
      _selectedCategory = category;
    });
    db.updateDatabase();
  }

  //create new note
  void createNewNote() {
    showDialog(
      context: context,
      builder: (context) {
        return NotesBox(
          note: _note,
          noteName: _notename,
          onSave: saveNewNote,
          onCancel: () => Navigator.of(context).pop(),
          selectedCategory: _selectedCategory,
          onCategoryChanged: onCategoryChanged,
          formKey: _formKey,
        );
      },
    );
    db.updateDatabase();
  }

  void deleteNote(int index) {
    setState(() {
      db.notes.removeAt(index);
    });
    db.updateDatabase();
  }

  void showViewer(int index) {
    // Store the selected note data for editing and track the index
    _notename.text = db.notes[index][0];
    _note.text = db.notes[index][1];
    _selectedCategory = db.notes[index][2];

    showDialog(
      context: context,
      builder: (context) {
        return NoteViewer(
          noteName: _notename,
          note: _note,
          selectedCategory: _selectedCategory,
          index: index,
          onSave: editedNote,
          onCancel: () => Navigator.of(context).pop(),
          onDelete: () {
            deleteNote(index);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      //Add Button
      floatingActionButton: FloatingActionButton(
        onPressed: createNewNote,
        child: Icon(Icons.add),
      ),

      body: GridView.builder(
        itemCount: db.notes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => showViewer(index),
            child: NotesTile(
              noteName: db.notes[index][0],
              preview: db.notes[index][1],
              category: db.notes[index][2],
            ),
          );
        },
      ),
    );
  }
}
