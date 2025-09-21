# 2.b) Implement different layout structures using Row, Column, and Stack widgets.
## Row, Column and Stack widgets

1. First create a new flutter project using the following command 

    ```
        flutter create lab_2b 
        cd lab_2b
    ```

2. You will see the standard folder structure and basic files created for you.

Replace the content of lib\main.dart with the one from this lib folder one at a time.

Note - This is an optional step you can directly use `flutter run` command.
3. You can use flutter build to build the project 

    Use the below command for android project.
    ```
        flutter build apk 
    ```
    Use the below command for web project
    ```
        flutter build web
    ```

4. You can use flutter run command

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

### Row 

This widget places one or more children in the horizontal axis with the given space constraints.

```dart

Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
                Text("one"),
                Text("two"),
                Text("three"),
            ],
)   

```

And you can place widgets in different ways using mainAxisAlignment property.

Possible values - 

     start   - aligns components to the start like [ABC      ] 
     center  - aligns components to the center like [    ABC   ]
     end     - aligns components to the end  like [      ABC]
     between - aligns components with space in between like  [A   B   C]
     around  - aligns components with space around like [  A   B   C  ]

Similar is the case with Column in the coming example.     

### Column

Column works in the vertical axis. It tries to totally cover the available vertical space; you can make sure that it shrinks to fit the height of its content using 

```dart

    Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center
    )

```
Note - MainAxisAlignment values are similar to Row but need to look at it vertically.

### Stack 

Thanks to the Stack widget you can overlap widgets and freely position them on the screen using Positioned.

```dart

    Stack(
        children: const [
                    Positioned(
                        top: 30,
                        left: 55
                        child: Text("Hello"),
                    ),
        ]
    )
    
```

