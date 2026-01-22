import 'package:flutter/material.dart';
import 'package:notes_v1/Utilities/note_viewer.dart';

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
  void viewNote() {
    showDialog(
      context: context,
      builder: (context) {
        return NoteViewer(
          noteName: widget.noteName,
          note: widget.preview,
          selectedCategory: widget.category,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: GestureDetector(
        onTap: viewNote,
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

                  child: Flexible(
                    child: Text(
                      widget.preview,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                      softWrap: true,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dashed,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
