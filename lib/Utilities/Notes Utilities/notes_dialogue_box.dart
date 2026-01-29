import 'package:flutter/material.dart';
import 'package:notes_v1/Utilities/my_button.dart';
import 'package:notes_v1/Utilities/validator.dart';

class NotesBox extends StatefulWidget {
  final TextEditingController noteName;
  final TextEditingController note;
  final Color selectedCategory;
  final Function(Color) onCategoryChanged;
  final GlobalKey<FormState> formKey;
  VoidCallback onSave;
  VoidCallback onCancel;

  NotesBox({
    super.key,
    required this.noteName,
    required this.note,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.formKey,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<NotesBox> createState() => _NotesBoxState();
}

class _NotesBoxState extends State<NotesBox> {
  late Color _currentCategory;

  @override
  void initState() {
    super.initState();
    _currentCategory = widget.selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: _currentCategory,
      content: SizedBox(
        width: 550,
        height: 550,
        child: Form(
          key: widget.formKey,
          child: Column(
            children: [
              //note name as label
              Text(
                "Create new Notes",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              //note name
              TextFormField(
                controller: widget.noteName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Note Name",
                ),
                validator: (value) => FieldValidator.validateNotEmpty(value),
              ),

              const SizedBox(height: 10),

              //Note info
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 15,
                controller: widget.note,
                textInputAction: TextInputAction.done,
                onSubmitted: (value) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a New Note",
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DropdownMenu<Color>(
                      initialSelection: _currentCategory,
                      label: const Text('Category'),
                      onSelected: (Color? value) {
                        if (value != null) {
                          setState(() {
                            _currentCategory = value;
                          });
                          widget.onCategoryChanged(value);
                        }
                      },
                      dropdownMenuEntries: <DropdownMenuEntry<Color>>[
                        DropdownMenuEntry(
                          value: Colors.purple,
                          label: 'Personal',
                        ),
                        DropdownMenuEntry(value: Colors.green, label: 'Work'),
                        DropdownMenuEntry(
                          value: Colors.orange,
                          label: 'Important',
                        ),
                        DropdownMenuEntry(value: Colors.red, label: 'Urgent'),
                        DropdownMenuEntry(value: Colors.blue, label: 'Other'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton(text: 'Save', onPressed: widget.onSave),
                      const SizedBox(width: 13),
                      MyButton(text: 'Cancel', onPressed: widget.onCancel),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
