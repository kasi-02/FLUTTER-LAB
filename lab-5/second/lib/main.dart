import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class CounterModel with ChangeNotifier {
  int _counter = 0;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  int get currentCount => _counter;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => CounterModel(),
        child: DemoPage(),
      ),
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: const Text(
            "+1",
            style: TextStyle(color: Colors.green, fontSize: 25),
          ),
          onPressed: () => counter.increment(),
        ),
        SizedBox(width: 40),
        Text("${counter.currentCount}", style: const TextStyle(fontSize: 30)),
        SizedBox(width: 40),
        ElevatedButton(
          child: const Text(
            "-1",
            style: TextStyle(color: Colors.red, fontSize: 25),
          ),
          onPressed: () => counter.decrement(),
        ),
      ],
    );
  }
}
