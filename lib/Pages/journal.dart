import 'package:flutter/material.dart';
import 'package:notes_v1/Utilities/Journal%20Utilities/journal_dialogue.dart';
import 'package:notes_v1/Utilities/Journal%20Utilities/journal_tile.dart';

class Journal extends StatefulWidget {
  const Journal({super.key});

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  final _entry = TextEditingController();
  final _day = TextEditingController();
  final _month = TextEditingController();

  List diaryEntries = [
    [17, "Jan", "Dear Diary"],
    [10, "Oct", "Tell me why"],
    [5, "Dec", "Aint nothing but a mistake"],
  ];

  //save new task
  void saveNewEntry() {
    setState(() {
      diaryEntries.add([_day.text, _month.text, _entry.text]);
      _entry.clear();
    });
    Navigator.of(context).pop();
  }

  //create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return JournalDialogue(
          controller: _entry,
          onSave: saveNewEntry,
          onCancel: () => Navigator.of(context).pop,
        );
      },
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      diaryEntries.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      //Add Button
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),

      //body
      body: ListView.builder(
        itemCount: diaryEntries.length,
        itemBuilder: (context, index) {
          return JournalTile(
            journalEntry: diaryEntries[index][2],
            day: diaryEntries[index][0],
            month: diaryEntries[index][1],
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
