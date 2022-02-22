
import 'package:flutter/material.dart';
import 'package:my_notes_app/screens/home.dart';

void main(){
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData.light().copyWith(
        inputDecorationTheme:  InputDecorationTheme(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
              ),
      ),
    );
  }
}

