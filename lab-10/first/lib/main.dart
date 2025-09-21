// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CounterWidget()));
}

class CounterWidget extends StatefulWidget {
  final int initialValue;

  CounterWidget({this.initialValue = 0});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    count = widget.initialValue;
  }

  void _increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$count'),
        ElevatedButton(onPressed: _increment, child: Text('Increment')),
      ],
    );
  }
}
