import 'package:flutter/material.dart';

class NoteViewer extends StatelessWidget {
  final noteName;
  final note;
  final Color selectedCategory;
  const NoteViewer({
    super.key,
    required this.noteName,
    required this.note,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      content: SizedBox(
        width: 550,
        height: 550,
        child: Column(
          children: [
            //Heading
            TextField(
              controller: noteName,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),

            const SizedBox(height: 10),
            //Context
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 15,
              controller: note,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ],
        ),
      ),
    );
  }
}
