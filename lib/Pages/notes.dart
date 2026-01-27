import 'package:flutter/material.dart';
import 'package:notes_v1/Utilities/Notes%20Utilities/note_viewer.dart';
import 'package:notes_v1/Utilities/Notes%20Utilities/notes_dialogue_box.dart';
import 'package:notes_v1/Utilities/Notes%20Utilities/notes_tile.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final _notes = [
    [
      "Groceries",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vel orci quis massa elementum iaculis. Donec consectetur mi congue iaculis molestie. Sed in dictum nunc. Proin ornare risus erat, nec porttitor diam accumsan id. Fusce semper, orci et gravida ultricies, sem dui condimentum odio, blandit molestie erat ante vitae libero. Duis porttitor nisl non gravida semper. Aenean id augue sed est eleifend molestie eget vitae metus. Praesent laoreet, nulla eu tempus tincidunt, dolor tellus luctus metus, faucibus euismod orci nibh ac turpis. ",
      Colors.purple,
    ],
    [
      "School Notes",
      "Vestibulum sed orci et nibh pulvinar scelerisque ut consectetur mauris. Donec nulla mi, viverra sed urna in, lobortis aliquet sem. Mauris luctus justo quis ex gravida, at sagittis justo rhoncus. Fusce semper maximus neque. Aliquam egestas ligula ut molestie sollicitudin. Duis bibendum lacus quis dui aliquet blandit. Duis risus mauris, fringilla vitae fringilla at, laoreet pharetra eros. Donec eleifend gravida magna eget vulputate. ",
      Colors.green,
    ],
    [
      "Workouts",
      "Morbi rhoncus volutpat augue, nec pharetra justo blandit non. Ut a mauris rhoncus, laoreet sem vel, euismod quam. Aenean elit neque, dignissim eget interdum eu, maximus a massa. Quisque ut quam ipsum. Fusce auctor egestas urna, a aliquet velit interdum ac. Nulla faucibus felis vulputate neque ullamcorper, ac porttitor sapien euismod. Duis efficitur facilisis nisi, non laoreet sem hendrerit eu. Quisque at scelerisque neque. ",
      Colors.blue,
    ],
    [
      "Messages",
      "Phasellus tincidunt efficitur tempus. Donec tempor eu dui ut bibendum. Vivamus in placerat sapien, et pellentesque libero. Praesent tristique molestie risus nec ornare. Vivamus elit enim, vestibulum ac tempus sed, condimentum gravida arcu. Vivamus nec egestas elit. Donec sit amet tellus quam. Fusce tristique nunc ut est pellentesque, vel rutrum turpis molestie. Ut et eros dolor. Vestibulum vel neque ut justo lacinia gravida. Curabitur pretium vel turpis eu consequat. Sed sollicitudin tristique urna, in consequat sapien interdum id. Sed vulputate egestas elit, elementum rhoncus mauris pellentesque nec. ",
      Colors.red,
    ],
    [
      "Notes",
      "Maecenas auctor odio libero, id ullamcorper lectus volutpat ac. Donec ligula sem, porttitor a tortor a, iaculis feugiat dolor. Praesent bibendum neque malesuada mi sollicitudin tempus eu at dui. Aenean imperdiet rutrum erat, in volutpat erat imperdiet et. Integer fringilla leo sed cursus dictum. Integer vel ligula odio. Donec turpis nibh, hendrerit vel pellentesque et, luctus eu risus. Etiam a enim pulvinar, imperdiet justo sit amet, vulputate odio. Sed laoreet dapibus eros quis tempor. Fusce at magna in dui convallis pharetra. Proin sit amet accumsan risus, et gravida tortor. Quisque et nunc consequat, pharetra magna et, tempus justo. ",
      Colors.orange,
    ],
  ];

  //text controller
  final _notename = TextEditingController();
  final _note = TextEditingController();
  Color _selectedCategory = Colors.blue;

  //save new note
  void saveNewNote() {
    setState(() {
      _notes.add([_notename.text, _note.text, _selectedCategory]);
      _notename.clear();
      _note.clear();
      _selectedCategory = Colors.blue; // Reset to default
    });
    Navigator.of(context).pop();
  }

  // Category change callback
  void onCategoryChanged(Color category) {
    setState(() {
      _selectedCategory = category;
    });
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
          onCancel: () => Navigator.of(context).pop,
          selectedCategory: _selectedCategory,
          onCategoryChanged: onCategoryChanged,
        );
      },
    );
  }

  void showViewer() {
    showDialog(
      context: context,
      builder: (context) {
        return NoteViewer(
          noteName: _notename,
          note: _note,
          selectedCategory: _selectedCategory,
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
        itemCount: _notes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: showViewer,
            child: NotesTile(
              noteName: _notes[index][0],
              preview: _notes[index][1],
              category: _notes[index][2],
            ),
          );
        },
      ),
    );
  }
}
