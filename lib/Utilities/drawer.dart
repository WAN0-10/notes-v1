import 'package:flutter/material.dart';
import 'package:notes_v1/Pages/journal.dart';
import 'package:notes_v1/Pages/notes.dart';
import 'package:notes_v1/Pages/todo_list.dart';

class Drawers extends StatefulWidget {
  Drawers({super.key});

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  //keeps track of current page
  int _selectedIndex = 0;

  //list of pages
  late final List _pages = [
    [Journal(), "One-Line Journal"],
    [TodoList(), "To-Do List"],
    [Notes(), "Notes"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex][1]),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        elevation: 3,
      ),

      body: Row(
        children: <Widget>[
          NavigationRail(
            backgroundColor: Colors.blueGrey,
            selectedIndex: _selectedIndex,

            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },

            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.my_library_books_outlined),
                label: Text('Journal'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.checklist_rtl),
                label: Text('ToDo'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.notes_sharp),
                label: Text('Notes'),
              ),
            ],
            selectedIconTheme: IconThemeData(color: Colors.black),
            unselectedIconTheme: IconThemeData(color: Colors.white),
          ),
          const VerticalDivider(thickness: 1, width: 1),

          //main content area
          Expanded(child: Center(child: _pages[_selectedIndex][0])),
        ],
      ),
    );
  }
}
