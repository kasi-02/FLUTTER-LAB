# 4.b) Implement navigation with named routes.

## Execution steps

```
        flutter create lab_4b
        cd lab_4b
            In the generated folder structure replace 
            the content of lib/main.dart 
            with the one given in this folder 
        flutter run 
            choose chrome  
```

## Notes

### Purpose

* Demonstrates Flutter navigation using named routes
* Uses onGenerateRoute for centralized, flexible route handling.

### Key Components

#### MaterialApp configuration

* *initialRoute*: '/' → starting screen is FirstScreen (usually HomeScreen).
* *onGenerateRoute*: *RouteGenerator.generateRoute* → all navigation requests are processed by a single function.

```dart
 MaterialApp(
      ....
      ....
      initialRoute: RouteGenerator.firstScreenRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
 );
```

#### RouteGenerator.generateRoute(RouteSettings settings)

Called automatically when *Navigator.pushNamed()* is used.
Example - 

```dart
Navigator.pushNamed<void>(context, "/second");
```

Switches on settings.name:

* '/' → returns FirstScreen (usually HomeScreen).
* '/second' → returns SecondScreen.
* Default → fallback to FirstScreen OR we can implement it to display 404 Page Not Found Error for better debugging.

```dart

static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
        case "/":
            return MaterialPageRoute<void>(builder: (_) => const FirstScreen());
        case "/second":
            return MaterialPageRoute<void>(builder: (_) => const SecondScreen());
        default:
            // Handle unknown routes: navigate to the first screen
            return MaterialPageRoute<void>(builder: (_) => const FirstScreen());
    }
}

```

MaterialPageRoute responsible for adaptive tansition such as zooms in, fades in or slide in etc. based on platform.

### Navigation

* *Navigator.pushNamed(context, '/second')* → go to SecondScreen.
* *Navigator.pop(context)* → go back to previous screen.

### Tip 

If you need to send some data to SecondScreen, then you can do it via settings as described in the below snippet :

```dart

case secondScreenRoute:
        final args = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => SecondScreen(data: args));

 .....
 .....

Object data = {"country":"India"};
Navigator.pushNamed<void>(context, RouteGenerator.secondScreenRoute, arguments: data );

```

