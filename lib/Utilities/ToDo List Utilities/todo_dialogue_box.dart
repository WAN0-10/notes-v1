// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:notes_v1/Utilities/my_button.dart';
import 'package:notes_v1/Utilities/validator.dart';

class DialogueBox extends StatelessWidget {
  final controller;
  final GlobalKey<FormState> formKey;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogueBox({
    super.key,
    required this.controller,
    required this.formKey,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 120,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              //get user input
              TextFormField(
                maxLines: 1,
                minLines: 1,
                controller: controller,
                maxLength: 160,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a New Task",
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
