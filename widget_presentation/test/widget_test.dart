// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widget_presentation/main.dart';

void main() {
  testWidgets('Quotes app renders controls and toggles scroll direction', (WidgetTester tester) async {
    await tester.pumpWidget(const QuotesApp());

    expect(find.text('Quotes Feed'), findsOneWidget);
    expect(find.textContaining('scrollDirection:'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);

    await tester.tap(find.textContaining('scrollDirection: vertical'));
    await tester.pumpAndSettle();

    expect(find.textContaining('scrollDirection: horizontal'), findsOneWidget);
  });
}
