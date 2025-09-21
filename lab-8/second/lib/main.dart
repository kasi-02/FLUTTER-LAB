// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() => runApp(AnimationDemoApp());

class AnimationDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AnimationDemoScreen());
  }
}

class AnimationDemoScreen extends StatefulWidget {
  @override
  _AnimationDemoScreenState createState() => _AnimationDemoScreenState();
}

class _AnimationDemoScreenState extends State<AnimationDemoScreen>
    with SingleTickerProviderStateMixin {
      
  bool _visible = true;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Slide Animation Setup
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(begin: Offset(-2.0, 0.0), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
        );

    // Start slide animation initially
    _slideController.forward();
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  void _toggleFade() {
    setState(() {
      _visible = !_visible;
    });
  }

  void _toggleSlide() {
    if (_slideController.status == AnimationStatus.completed) {
      _slideController.reverse();
    } else {
      _slideController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Animation Demo')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Fade Animation:', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Container(
                width: 150,
                height: 150,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  'Fade Me',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _toggleFade,
              child: Text(_visible ? 'Fade Out' : 'Fade In'),
            ),
            Divider(height: 40),
            Text('Slide Animation:', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            SlideTransition(
              position: _slideAnimation,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text(
                  'Slide Me',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _toggleSlide,
              child: Text('Slide Toggle'),
            ),
          ],
        ),
      ),
    );
  }
}
