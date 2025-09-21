import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp(); // Good idea!

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hello"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("World"), SizedBox(width: 100), Text("!!")],
          ),
        ],
      ),
    );
  }
}
