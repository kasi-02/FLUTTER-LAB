import 'package:flutter/material.dart';

// Lab experiment for Flutter navigation

void main() {
  runApp(
    MaterialApp(
      title: 'Navigation Demo App',
      initialRoute: "/",
      routes: {
        "/": (context) => FirstPage(),
        "/second": (context) => SecondPage(),
      },
    ),
  );
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello World')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/second");
              },
              child: Text('Next Page'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Hello, World!")));
              },
              child: Text("Msg"),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: Column(
          children: [
            Text('This is the second page'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("No back history item")),
                  );
                }
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
