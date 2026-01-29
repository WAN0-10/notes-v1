import 'package:flutter/material.dart';
import 'package:notes_v1/Utilities/my_button.dart';
import 'package:notes_v1/Utilities/validator.dart';

class JournalDialogue extends StatelessWidget {
  final controller;
  final day;
  final month;
  final GlobalKey<FormState> formKey;
  VoidCallback onSave;
  VoidCallback onCancel;

  JournalDialogue({
    super.key,
    required this.controller,
    required this.day,
    required this.month,
    required this.formKey,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      content: SizedBox(
        height: 180,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                "$day",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                month,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),

              //get user input
              TextFormField(
                controller: controller,
                maxLength: 160,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a New Entry",
                ),
                validator: (value) => FieldValidator.validateNotEmpty(value),
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
                  MyButton(text: 'Cancel', onPressed: onCancel),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
