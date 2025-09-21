import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(AnimationDemoApp());

class AnimationDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AnimationDemo());
  }
}

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  double _fontSize = 100;
  Color _fontColor = Colors.blue;

  double _boxSize = 100;
  Color _boxColor = Colors.blue;

  BorderRadiusGeometry _borderRadius = BorderRadiusGeometry.circular(25);

  final random = Random();

  void _animateBox() {
    setState(() {
      _fontSize = 20 + random.nextInt(80).toDouble();
      _boxSize = random.nextInt(400).toDouble();
      _boxColor = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        random.nextDouble(),
      );
      _fontColor = _boxColor;
      _borderRadius = BorderRadiusGeometry.circular(
        random.nextInt(25).toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Animation Example")),
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              width: _boxSize,
              height: _boxSize,
              decoration: BoxDecoration(
                color: _boxColor,
                borderRadius: _borderRadius,
              ),
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
            ),
            SizedBox(height: 40),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 600),
              curve: Curves.linear,
              style: TextStyle(
                fontSize: _fontSize,
                color: _fontColor,
                fontWeight: FontWeight.bold,
              ),
              child: const Text("Flutter Rocks!"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateBox,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
