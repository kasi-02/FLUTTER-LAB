# 6.b) Apply styling using themes and custom styles.

## Execution steps

```
flutter create lab_6b
cd lab_6b
    In the generated folder structure replace the content of lib/main.dart with the one given in this folder 
flutter run 
    choose chrome  
```

## Notes

```dart

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theming Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.teal,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.orange, // Accent color
        ),

        // Define the default font family.
        fontFamily: 'Roboto',

        // Define the default `TextTheme`.
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
          bodyLarge: TextStyle(fontSize: 18.0, color: Colors.black87),
          labelLarge: TextStyle(fontSize: 16.0, color: Colors.white),
        ),

        // Global elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Custom text style not in the theme
    final TextStyle customStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.2,
      color: Colors.deepPurple,
    );

    return Scaffold(
      appBar: AppBar(title: Text('Flutter Theme Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Styled with Theme',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 10),
            Text(
              'Using the bodyLarge style from the app theme.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 20),
            Text('Using a custom inline style.', style: customStyle),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text('Themed Elevated Button'),
            ),
            SizedBox(height: 15),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 2,
                ),
                foregroundColor: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {},
              child: Text('Custom Styled Outlined Button'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

```


```
main() ──▶ runApp(MyApp)
              │
              ▼
        ┌─────────────────────────┐
        │   MaterialApp           │
        │  - title: 'Theming Demo'│
        │  - theme: ThemeData(...)│  ◀── Defines global theme:
        │                         │       • Colors
        │                         │       • Typography
        │                         │       • Button styles
        └──────────┬──────────────┘
                   │
                   ▼
             HomeScreen (Scaffold)
                   │
       ┌───────────┼──────────────────────────────────────────────────────────┐
       │           │                                                          │
       ▼           │                                                          ▼
   AppBar      Body (Column)                                        FloatingActionButton
   - title     - Padding & Column                                       - Icon(Icons.add)
                - Themed Text (Theme.of(context).textTheme.headlineLarge)
                - Themed Text (bodyLarge)
                - Custom styled Text (inline TextStyle)
                - ElevatedButton (uses ElevatedButtonTheme)
                - OutlinedButton (explicit styleFrom using Theme.of(context).colorScheme.secondary)
                
```

How the Theme Flows Through the Tree
1. MaterialApp with theme: ThemeData(...)
    * This theme automatically propagates to all widgets in the widget tree below.
    * Widgets can access the global theme using Theme.of(context).

2. Global Theme Styles Used
    * Colors:
        * primaryColor → AppBar background
        * colorScheme.secondary → FAB background, OutlinedButton border

    * Text styles:
        * headlineLarge, bodyLarge → Several Text widgets
    * ElevatedButtonTheme:
        * All ElevatedButtons get consistent padding, rounded corners

3. Custom / Local Styles
    
    * Some styles are set inline (e.g., deepPurple TextStyle in customStyle)
    * These override the global theme only for that widget

4. Theme.of(context)
    * Looks up the nearest Theme in the widget tree (from MaterialApp’s ThemeData)
    * Allows widgets to remain consistent with app-wide styling
    * Example:

        ```dart

            Theme.of(context).colorScheme.secondary
            Theme.of(context).textTheme.headlineLarge
            
        ```