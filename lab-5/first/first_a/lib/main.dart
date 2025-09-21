import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MyInfo());
  }
}

class MyInfo extends StatelessWidget {
  // Notice the constant constructor
  const MyInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: const [
            Icon(Icons.person),
            SizedBox(width: 40),
            Text("ABC"),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.email),
            SizedBox(width: 40),
            Text("ABC@xyz.com"),
          ],
        ),
      ],
    );
  }
}
