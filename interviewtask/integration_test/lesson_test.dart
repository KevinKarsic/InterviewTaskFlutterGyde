import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:interviewtask/lesson_card.dart';
import 'package:interviewtask/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Check if adding and deleting lesson functions correctly',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(LessonCard), findsNothing);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), 'Lektion 1');
    await tester.enterText(find.byType(TextField).at(1), '45 min');
    await tester.enterText(find.byType(TextField).at(2), 'Mathematik');
    await tester.pumpAndSettle();

    await tester.tap(find.text('Hinzufügen'));
    await tester.pumpAndSettle();

    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);
    addTearDown(gesture.removePointer);
    await tester.pump();
    await gesture.moveTo(tester.getCenter(find.byType(LessonCard)));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.byType(IconButton), findsOneWidget);
    await tester.tap(find.byIcon(Icons.delete_outlined));
    await tester.pumpAndSettle();

    expect(find.byType(LessonCard), findsNothing);
  });
}
