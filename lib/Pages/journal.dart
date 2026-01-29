import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_v1/Utilities/Journal%20Utilities/journal_dialogue.dart';
import 'package:notes_v1/Utilities/Journal%20Utilities/journal_tile.dart';
import 'package:notes_v1/data/journal_database.dart';

class Journal extends StatefulWidget {
  const Journal({super.key});

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  JournalDatabase db = JournalDatabase();

  @override
  void initState() {
    // if this is the first time ever opening the app, then create default data
    if (_myBox.get('DIARYENTRIES') == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

  final _entry = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.diaryEntries.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String dayOnly = DateFormat('d').format(now);
    final String monthOnly = DateFormat('MMMM').format(now);

    //save new task
    void saveNewEntry() {
      if (_formKey.currentState!.validate()) {
        setState(() {
          db.diaryEntries.add([dayOnly, monthOnly, _entry.text]);
          _entry.clear();
        });
        Navigator.of(context).pop();
        db.updateDatabase();
      }
    }

    //create a new task
    void createNewTask() {
      showDialog(
        context: context,
        builder: (context) {
          return JournalDialogue(
            day: dayOnly,
            month: monthOnly,
            controller: _entry,
            formKey: _formKey,
            onSave: saveNewEntry,
            onCancel: () => Navigator.of(context).pop(),
          );
        },
      );
      db.updateDatabase();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      //Add Button
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),

      //body
      body: ListView.builder(
        itemCount: db.diaryEntries.length,
        itemBuilder: (context, index) {
          return JournalTile(
            journalEntry: db.diaryEntries[index][2],
            day: db.diaryEntries[index][0],
            month: db.diaryEntries[index][1],
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
