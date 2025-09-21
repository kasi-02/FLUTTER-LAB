import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp(); // Good idea!

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Text(
        'Styled Text',
        style: TextStyle(
          color: Colors.deepPurple,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
