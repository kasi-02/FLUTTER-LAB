import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp(); // Good idea!

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        margin: const EdgeInsets.all(40.0),
        padding: const EdgeInsets.all(40.0),
        color: Colors.lightBlue[100],
        child: const Text('Padded & Margined container'),
      ),
    );
  }
}
