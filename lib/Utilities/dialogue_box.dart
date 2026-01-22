// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:notes_v1/Utilities/my_%20button.dart';

class DialogueBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogueBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a New Task",
              ),
            ),

            const SizedBox(height: 20),
            //buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save
                MyButton(text: 'Save', onPressed: onSave),

                const SizedBox(width: 13),
                //cancel
                MyButton(text: 'Delete', onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
