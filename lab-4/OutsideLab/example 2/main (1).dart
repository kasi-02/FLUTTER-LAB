import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

/// Data model for the Second Screen's state.
/// This class extends ChangeNotifier to notify listeners when the state changes,
/// allowing Provider to rebuild widgets that depend on this data.
class SecondScreenData extends ChangeNotifier {
  bool _isToggled = false;

  bool get isToggled => _isToggled;

  /// Toggles the [_isToggled] state and notifies listeners.
  void toggleState() {
    _isToggled = !_isToggled;
    notifyListeners();
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SecondScreenData>(
      create: (BuildContext context) => SecondScreenData(),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Screen Navigation Example',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(colorSchemeSeed: Colors.blue),
          initialRoute: RouteGenerator.firstScreenRoute,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
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
    // Watch the SecondScreenData to rebuild the UI when `isToggled` changes.
    final SecondScreenData secondScreenData = context.watch<SecondScreenData>();

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
              secondScreenData.isToggled ? 'State is ON' : 'State is OFF',
              style: TextStyle(
                fontSize: 20,
                color: secondScreenData.isToggled ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Read the SecondScreenData to call the `toggleState` method.
                context.read<SecondScreenData>().toggleState();
              },
              child: Text(secondScreenData.isToggled ? 'Turn OFF' : 'Turn ON'),
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
