import 'package:flutter/material.dart';

// A reference example for route generation in Flutter
// Outside of Lab.

/// A class responsible for generating routes for the application.
/// It centralizes route definitions and the logic for creating pages.
class RouteGenerator {
  static const String firstScreenRoute = '/';
  static const String secondScreenRoute = '/second';

  /// Generates a [Route] based on the given [RouteSettings].
  ///
  /// This method uses a switch statement to match the route name
  /// and returns a [MaterialPageRoute] for the corresponding screen.
  /// If an unknown route is requested, it defaults to the first screen.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case firstScreenRoute:
        return MaterialPageRoute<void>(builder: (_) => const FirstScreen());
      case secondScreenRoute:
        return MaterialPageRoute<void>(builder: (_) => const SecondScreen());
      default:
        // Handle unknown routes: navigate to the first screen
        return MaterialPageRoute<void>(builder: (_) => const FirstScreen());
    }
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen Navigation Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      initialRoute: RouteGenerator.firstScreenRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed<void>(
                  context,
                  RouteGenerator.secondScreenRoute,
                );
              },
              child: const Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Second Screen!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop<void>(context);
              },
              child: const Text('Go back to First Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
