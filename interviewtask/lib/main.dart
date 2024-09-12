// main.dart
import 'package:flutter/material.dart';
import 'lesson_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lektionen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LessonList(),
    );
  }
}
