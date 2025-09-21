import 'package:flutter/material.dart';

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

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool _isToggled = false; // State is now local to SecondScreen's State object

  /// Toggles the [_isToggled] state and rebuilds the widget.
  void _toggleState() {
    setState(() {
      _isToggled = !_isToggled;
    });
  }

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
            const SizedBox(height: 16),
            Text(
              _isToggled ? 'State is ON' : 'State is OFF',
              style: TextStyle(
                fontSize: 20,
                color: _isToggled ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _toggleState, // Call the local state method
              child: Text(_isToggled ? 'Turn OFF' : 'Turn ON'),
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
