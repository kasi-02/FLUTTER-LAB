import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String orientation = MediaQuery.of(context).orientation.name;
    return MaterialApp(home: Text('Width $width, Orientation: $orientation'));
  }
}
