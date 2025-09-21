# 3.b) Implement media queries and breakpoints for responsiveness.
## MediaQuery 


1. First create a new flutter project using the following command 

    ```
        flutter create lab_3b 

        cd lab_3b
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

The MediaQuery class is a sort of more powerful version of LayoutBuilder because it’s always available and it gives you more control over various settings of the screen. It just requires a context:

```dart

@override
Widget build(BuildContext context) {
    final width = MediaQuery.of(context)?.size.width ?? -1;
    return Text("$width");
}

```

With size you also have access to height, padding, distances and much more. For example, you might want to know what is the current orientation of the device:

```dart

    final orientation = MediaQuery.of(context)?.orientation;
    // Using a null check rather than providing a default value
    if ((orientation != null) && (orientation == Orientation.portrait)) {...}
    
```


### Comparison between MediaQuery and LayoutBuilder 

### MediaQuery 

Global, providing information about the entire device's screen and environment.

Information Provided:

Accesses global device properties such as screen size (width, height), orientation, pixel density, text scale factor, and platform brightness.

Use Cases:

Ideal for making layout decisions based on the overall device characteristics, like adjusting font sizes or showing/hiding entire sections of the UI based on screen size or orientation.

Example:

Adjusting the layout for a phone versus a tablet, or a portrait versus a landscape orientation.

### LayoutBuilder

Local, providing information about the constraints imposed by the parent widget on its child.

Information Provided:

Provides the BoxConstraints object, which defines the minimum and maximum width and height allowed for the child widget by its parent.

Use Cases:

Perfect for creating widgets that adapt their size and layout based on the available space within their immediate parent. This is useful for creating flexible components inside smaller sections of the UI, or for making a widget fill the available space within a specific container. 

Example:

Making a chart dynamically resize within a container that itself might be part of a larger responsive layout.