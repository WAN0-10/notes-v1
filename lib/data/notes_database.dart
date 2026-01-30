import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_v1/Pages/notes.dart';
import 'package:flutter/material.dart';

class NotesDatabase {
  List notes = [];

  //reference the box
  final _myBox = Hive.box('myBox');

  //run this method for first time use
  void createInitialData() {
    notes = [
      [
        "Random Ideas",
        "App concept: simple, fast, probably abandoned\n Learn a new skill before motivation disappears\nClean workspace so my brain stops screaming\nStart a project. Finish a project. Revolutionary",
        Colors.purple,
      ],
      [
        "Password Reminder",
        "Email: something123\nWiFi: same but with a capital letter\nNote to self: stop writing passwords in Notepad",
        Colors.green,
      ],
      [
        "Groceries",
        "Milk\nBread\nEggs\nSnacks I don’t need\nOne healthy item to ease my conscience",
        Colors.blue,
      ],
      [
        "Don't Forget!!!",
        "Backup important files\nCharge devices before they die dramatically\nDeadlines are real, even if I ignore them\nDrink water. No, really.",
        Colors.red,
      ],
      [
        "Yap Session",
        "Remember to check emails in the morning and again at night, even though nothing important ever shows up\nKeep track of deadlines somewhere other than your head, because your head is unreliable\nSave work frequently. Computers wait for confidence before crashing\nClean the desktop. Icons breeding uncontrollably is not a system\nTake breaks that don’t involve switching to a different screen\nWrite ideas down immediately. Future-you will swear you “would’ve remembered”\nEat properly when possible. Surviving on caffeine and hope is not a strategy\nSleep at reasonable hours or at least pretend to plan to\nBack up files twice. Trust nothing\nIf everything feels overwhelming, step away instead of spiraling dramatically\nProgress counts even when it’s slow and unimpressive\nClose tabs. All of them. Yes, even that one",
        Colors.orange,
      ],
    ];
  }

  //load data from database
  void loadData() {
    notes = _myBox.get("NOTES");
  }

  //update database
  void updateDatabase() {
    _myBox.put("NOTES", notes);
  }
}
