import 'package:flutter/material.dart';

class NotesTile extends StatefulWidget {
  final noteName, preview;
  final category;

  const NotesTile({
    super.key,
    required this.noteName,
    required this.preview,
    required this.category,
  });

  @override
  State<NotesTile> createState() => _NotesTileState();
}

class _NotesTileState extends State<NotesTile> {
  @override
  Widget build(BuildContext context) {
    // Split preview by line breaks and format each line with a bullet point
    List<String> lines = widget.preview.split('\n');

    // Create a single text with bullet points for each line
    String formattedText = lines.map((line) => '• $line').join('\n');

    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        decoration: BoxDecoration(
          color: widget.category,
          borderRadius: BorderRadius.circular(12),
        ),
        //column
        child: Center(
          child: Column(
            children: [
              //note name as label
              Text(
                widget.noteName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              //Preview
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Container(
                  constraints: BoxConstraints(maxHeight: 200),
                  child: SingleChildScrollView(
                    child: Text(
                      formattedText,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                      softWrap: true,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
