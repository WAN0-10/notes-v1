import 'package:flutter/material.dart';
import 'package:notes_v1/Utilities/my_button.dart';

class NoteViewer extends StatelessWidget {
  final noteName;
  final note;
  final Color selectedCategory;
  final int index;
  final Function(int) onSave;
  VoidCallback onCancel;
  VoidCallback onDelete;

  NoteViewer({
    super.key,
    required this.noteName,
    required this.note,
    required this.selectedCategory,
    required this.index,
    required this.onSave,
    required this.onCancel,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: selectedCategory,
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  text: 'Delete',
                  onPressed: onDelete,
                  color: Colors.red,
                ),

                const SizedBox(width: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyButton(text: 'Save', onPressed: () => onSave(index)),
                    const SizedBox(width: 13),
                    MyButton(text: 'Cancel', onPressed: onCancel),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
