import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class JournalTile extends StatelessWidget {
  final journalEntry;
  final day;
  final month;
  Function(BuildContext)? deleteFunction;

  JournalTile({
    super.key,
    required this.journalEntry,
    required this.day,
    required this.month,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),

        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              //Day
              Center(
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
                      month.substring(0, 3),

                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 12),
              Container(
                height: 50, // Explicitly define the height
                width: 2, // The line's thickness
                color: Colors.black, // The line's color
              ),
              SizedBox(width: 12),
              //Entry name
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 2),
                  child: Text(journalEntry, maxLines: 2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
