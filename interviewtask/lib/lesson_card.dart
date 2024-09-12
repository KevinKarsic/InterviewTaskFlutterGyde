import 'package:flutter/material.dart';
import 'lesson.dart';

class LessonCard extends StatefulWidget {
  final Lesson lesson;
  final VoidCallback onDelete;

  const LessonCard({super.key, required this.lesson, required this.onDelete});

  @override
  State<LessonCard> createState() {
    return _LessonCardState();
  }
}

class _LessonCardState extends State<LessonCard> {
  bool isHovered = false;

  void _onMouseEnter(PointerEvent details) {
    setState(() {
      isHovered = true;
    });
  }

  void _onMouseExit(PointerEvent details) {
    setState(() {
      isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: MouseRegion(
          onEnter: _onMouseEnter,
          onExit: _onMouseExit,
          child: Stack(
            children: [
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.book),
                      title: Text(widget.lesson.lessonChapter),
                      subtitle: Text(widget.lesson.lessonTitel),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.watch),
                              Text(widget.lesson.lessonLenght)
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.type_specimen),
                              Text(widget.lesson.lessonType)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (isHovered)
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(Icons.delete_outlined),
                    onPressed: widget.onDelete,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
