import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_v1/Utilities/drawer.dart';
import 'package:notes_v1/Utilities/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  //init hive
  await Hive.initFlutter();

  //open the box
  var box = await Hive.openBox('myBox');

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Drawers(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
