import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp(); // Good idea!

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Image.network(
        'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}
