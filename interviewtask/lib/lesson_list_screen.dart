import 'package:flutter/material.dart';
import 'lesson.dart';
import 'lesson_card.dart';

class LessonList extends StatefulWidget {
  const LessonList({super.key});

  @override
  State<LessonList> createState() {
    return _LessonListState();
  }
}

class _LessonListState extends State<LessonList> {
  List<Lesson> lessons = [];
  int lessonCount = 0;

  void removeLesson(int index) {
    setState(() {
      lessons.removeAt(index);
    });
  }

  void addLesson(Lesson newLesson) {
    setState(() {
      lessons.add(newLesson);
    });
  }

  Future<void> _showAddLessonDialog() async {
    String titel = '';
    String length = '';
    String topic = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Neue Lektion hinzufügen'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Lektion'),
                onChanged: (value) => titel = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Dauer'),
                onChanged: (value) => length = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Typ'),
                onChanged: (value) => topic = value,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Abbrechen'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Hinzufügen'),
              onPressed: () {
                if (titel.isNotEmpty && length.isNotEmpty && topic.isNotEmpty) {
                  lessonCount++;
                  addLesson(
                      Lesson("Lektion $lessonCount", length, titel, topic));
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lektionen'),
      ),
      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          return LessonCard(
            lesson: lessons[index],
            onDelete: () => removeLesson(index),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddLessonDialog,
        tooltip: 'Lektion hinzufügen',
        child: const Icon(Icons.add),
      ),
    );
  }
}
