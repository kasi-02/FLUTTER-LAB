# 4.a) Set up navigation between different screens using Navigator

## Execution steps

```
        flutter create lab_4a
        cd lab_4a
            In the generated folder structure replace 
            the content of lib/main.dart 
            with the one given in this folder 
        flutter run 
            choose chrome  
```

## Notes

### 1. What is Screen Navigation?

In Flutter, navigation refers to moving from one screen (or page) to another. Screens are usually represented by Widgets like Scaffold.

Flutter uses a navigation stack:

* The first screen is pushed onto the stack when the app starts.
* Every time you navigate forward, a new screen is pushed on top.
* Going back pops the top screen off, returning you to the previous one.


### 2. How It Works in this Example?

It has two screens:
* FirstScreen (with counter & button to go forward)
* SecondScreen (with a button to go back)

*A. Moving from First Screen to Second Screen*

Code from the FirstScreen:

```dart

ElevatedButton(
    onPressed: () {
        Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => const SecondScreen(),
            ),
        );
    },
    child: const Text('Go to Second Screen'),
)

```

*How this works:*

* Navigator.push → adds a new route (screen) to the navigation stack.
* MaterialPageRoute → creates a transition animation and screen structure for Material Design.
* builder → returns the widget for the new screen (SecondScreen()).

*Stack before press:*

```text 
    [FirstScreen]
```

*Stack after press:*

```text
    [FirstScreen, SecondScreen]  ← SecondScreen is now active
```

*B. Going Back from Second Screen*

```dart

    ElevatedButton(
        onPressed: () {
            Navigator.pop<void>(context);
        },
        child: const Text('Go back to First Screen'),
    )

```

*How this works:*

* Navigator.pop → removes the topmost screen from the stack.
* After popping, the previous screen becomes visible again.

*Stack before press:*

```text
    [FirstScreen, SecondScreen]
```

*Stack after press:*

```text
    [FirstScreen]  ← FirstScreen becomes visible again
```

### 3. The Role of context

* The context is tied to a widget’s position in the widget tree.
* Navigator uses it to find the current navigation stack and perform push/pop operations.

### 4. Key Takeaways from Your Example

* *Navigator.push* → Go to a new screen.
* *Navigator.pop* → Return to the previous screen.
* *MaterialPageRoute* → is a common way to create navigation transitions in Material apps.
* *Navigation in Flutter operates like a stack data structure: Last In, First Out (LIFO).*