# 2.a) Explore various Flutter widgets (Text, Image, Container, etc.).

## Basic Widgets Text, Image, Container

1. First create a new flutter project using the following command 

    ```
        flutter create lab_2a 
        cd lab_2a
    ```

2. You will see the standard folder structure and basic files created for you.

Replace the lib\main.dart with the one from this lib folder.

3. You can use flutter build to build the project 

    Use the below command for android project.
    ```
        flutter build apk 

    ```
    Use the below command for web project
    ```
        flutter build web
    ```

4. You can use flutter run command to launch the project 

    ```
        flutter run
    ```

   Emulator - launch the emulator and run the application in the emulator.
   Note - Applicable for VS Code, as a pre-requisite you need to 
   first create a virtual device through android virtual device manager.
   ``` 
        ctrl + shift + p
        Flutter: Launch Emulator 
        choose the device you created using AVD.
   ```


## Notes 

In Flutter everything that appears on the screen is called "widget". User interfaces in Flutter is a
composition of widgets i.e. nesting of widgets one inside the other. When you nest widgets one inside the other you create a hierarchy called "widget tree" in which there are parents and children.

```dart

    import 'package:flutter/material.dart';

    void main() {
        runApp(MyApp());
    }
    
    class MyApp extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return Column(
                    children: <Widget>[
                        Text("Hello"),
                        Text("Flutter),
                    ]
            );
        }
    }
```

1. main() method is the entry point 
2. runApp() takes a Widget and makes it a root of the widget tree.
3. MyApp is the root widget and Column is its child and the other two Text widgets are the children of Column.

```State in the first screen (like _counter) is preserved when navigating away and back.


        MyApp   <-- root
          ^
          |
        Column  <-- child of root MyApp
          ^
          |
     ------------
    |            |
    Text        Text  <-- children of column

```

## Basic Widgets

### Text

Text widget is used to display a piece of text.

```dart

    const Text(
        "Some text here",
        style: TextStyle(
                    color: Colors.amber,
                    fontSize: 18,
                    wordSpacing: 4,
                ),
    );

```

### Container 

Equivalent of a div tag in the HTML world; it’s a general purpose container you can use to customize painting, positioning, sizing etc.

```dart

    Container(
        height: 70,
        width: 160,
        color: Colors.blueGrey,
        alignment: Alignment.center,
        transform: Matrix4.rotationZ(-0.25),
        child: const Text(
                        "Containers!",
                        style: TextStyle(
                                color: Colors.white,
                                fontSize: 25
                                )
                )
    );

```

### Image 

Image widget gives us the ability to load and display the images. 

1. Loading images from assets through pubspec.yaml e.g.
   Note - for this to work first you need to store the asset in the project and declare the asset in the pubspec.yaml
   
```dart

    @override
    Widget build(BuildContext context) {
        return Center(
                child: Image.asset("myassets/something.png"),
        );
    }

```
2. Loading images from network url e.g.

```dart

    Image.network(
        'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
        width: 150,
        height: 150,
        fit: BoxFit.cover,
    )
    
```

