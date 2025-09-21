import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab10a/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: CounterWidget(initialValue: 2)));

    debugPrint("launched text widget ");

    // Verify initial value
    expect(find.text('2'), findsOneWidget);

    debugPrint("Initial value verification passed.");

    // Tap Increment button
    await tester.tap(find.byType(ElevatedButton));

    debugPrint("Button clicked ");

    await tester.pump();

    debugPrint("waiting UI changes completed.");

    // Verify Value Incremented
    expect(find.text('3'), findsOneWidget);

    debugPrint("expected outcome after click is successful ");
  });
}
