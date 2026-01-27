import 'package:flutter/material.dart';
import 'package:notes_v1/Pages/journal.dart';
import 'package:notes_v1/Pages/notes.dart';
import 'package:notes_v1/Pages/todo_list.dart';
import 'package:notes_v1/Utilities/theme_provider.dart';
import 'package:provider/provider.dart';

class Drawers extends StatefulWidget {
  const Drawers({super.key});

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  //keeps track of current page
  int _selectedIndex = 0;
  bool _lights = false;
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
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 3,
      ),

      body: Row(
        children: <Widget>[
          NavigationRail(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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

            //Switch
            trailing: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Switch(
                  thumbIcon: WidgetStateProperty.resolveWith<Icon?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.selected)) {
                      return const Icon(
                        Icons.mode_night_outlined,
                      ); // Icon when the switch is ON
                    }
                    return const Icon(
                      Icons.wb_sunny_rounded,
                    ); // Icon when the switch is OFF
                  }),
                  value: _lights,
                  onChanged: (bool newValue) {
                    setState(() {
                      Provider.of<ThemeProvider>(
                        context,
                        listen: false,
                      ).toggleTheme();
                      _lights = newValue;
                    });
                  },
                  activeThumbColor: Colors.white,
                  activeTrackColor: Colors.black,
                  inactiveTrackColor: Colors.deepPurple,
                  trackOutlineColor: WidgetStateProperty.all(Colors.black),
                ),
              ),
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),

          //main content area
          Expanded(child: Center(child: _pages[_selectedIndex][0])),
        ],
      ),
    );
  }
}
