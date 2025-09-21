# 10.a) Write unit tests for UI components.

## Execution Steps

```

flutter create lab10a

cd lab10a
    In the generated folder structure replace the content of lib/main.dart with the one given in the lib\ folder 
    In the generated folder structure replace the content of test/widget_test.dart with the one given in the test\ folder 

flutter test 

```

### ***NOTE: 
Here we are using **flutter test** instead of **flutter run** here **widget_test.dart** is our target.

## Notes

```dart

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

```

Let's break down each test call and its role in the unit test for your CounterWidget:

### 1. testWidgets

Purpose: Defines a widget test and sets up the testing environment.

How it works: It runs the provided callback (test body) inside a simulated Flutter test environment. This is necessary for any code that interacts with widgets, as it handles setup and teardown automatically and provides a fresh WidgetTester instance for each test.

Usage in Example:

```dart

testWidgets('Counter initializes and increments', (WidgetTester tester) async { ... })

```

This method takes a test description (for reporting) and a test callback with a WidgetTester parameter.

### 2. tester.pumpWidget

Purpose: Renders the widget in a simulated test environment so you can interact with or inspect the UI.

How it works: Builds the widget tree and renders it, much like mounting a widget in the live app.

Usage in Example:

```dart

await tester.pumpWidget(MaterialApp(home: CounterWidget(initialValue: 2)));

```

Required before you can query, interact with, or test any widgets.

### 3. Finders — find.text, find.byType

Purpose: Locates widgets in the rendered tree for inspection or interaction.

How it works: Uses various strategies (find.text, find.byType, etc.) to find widgets based on text, type, key, or instance.

Usage in Example:

```dart

expect(find.text('2'), findsOneWidget);
await tester.tap(find.byType(ElevatedButton));
expect(find.text('3'), findsOneWidget);

```

### 4. tester.tap

Purpose: Simulates a user clicking/tapping on a widget.

How it works: Finds the widget and generates a tap event as if a user interacted with it.

Usage in Example:

```dart

await tester.tap(find.byType(ElevatedButton));

```

Often followed by tester.pump() to process changes.

### 5. tester.pump

Purpose: Processes any pending UI frames and rebuilds the widget tree.

How it works: Ensures that state changes (like setting new count) are reflected in the UI after an interaction.

Usage in Example:

```dart

await tester.pump();

```

This is crucial after interactions, so the updated UI is available for inspection.

### 6. expect

Purpose: Asserts that certain conditions are true, such as the presence, count, or absence of widgets.

How it works: Uses matchers (like findsOneWidget, findsNothing, etc.) to check if your expectations about the widget tree and its state are met.

Usage in Example:

```dart

expect(find.text('2'), findsOneWidget);
expect(find.text('3'), findsOneWidget);

```
