import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_v1/Pages/journal.dart';

class JournalDatabase {
  List diaryEntries = [];

  //reference the box
  final _myBox = Hive.box('myBox');

  //run this method for first time use
  void createInitialData() {
    diaryEntries = [
      [
        17,
        "January",
        "Today was surprisingly productive. I finally finished that project at work, which has been hanging over my head for weeks. The relief is immense! ",
      ],
      [
        10,
        "October",
        "Everything feels a bit overwhelming today. My conversation with [Name] earlier really stayed on my mind. I feel like I didn’t say enough, or perhaps I said too much.",
      ],
      [
        5,
        "December",
        "Today was exactly what I needed: nothing. I spent the morning reading in bed, watched the leaves dance outside my window, and didn't check my email once",
      ],
    ];
  }

  //load data from database
  void loadData() {
    diaryEntries = _myBox.get("DIARYENTRIES");
  }

  //update database
  void updateDatabase() {
    _myBox.put("DIARYENTRIES", Journal);
  }
}
