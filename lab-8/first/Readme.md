# 8.a) Add animations to UI elements using Flutter's animation framework.

## Execution steps

```
flutter create lab8a
cd lab8a
    In the generated folder structure replace the content of lib/main.dart with the one given in this folder 
flutter run 
    choose chrome  
```

## Notes

ImplicitlyAnimatedWidgets (and their subclasses) automatically animate changes in their properties whenever they change. These widgets take an Animation as an argument to power the animation. This gives the developer full control over the animation at the cost of requiring you to manually manage the underlying AnimationController.

Examples such as 
1. AnimatedContainer
2. AnimatedDefaultTextStyle
3. AnimatedPadding 
etc.

### AnimatedContainer

Flutter provides the AnimatedContainer widget. Like the Container widget, AnimatedContainer allows you to define the width, height, background colors, and more. However, when the AnimatedContainer is rebuilt with new properties, it automatically animates between the old and new values. In Flutter, these types of animations are known as "implicit animations."

```dart

AnimatedContainer(
    width: _boxSize,
    height: _boxSize,
    decoration: BoxDecoration(
        color: _boxColor,
        borderRadius: _borderRadius,
    ),
    duration: Duration(seconds: 1),
    curve: Curves.easeInOut,
)

```

**Note:**  Changes to the variables *_boxSize*, *_boxColor* and *_borderRadius* will animate the change for the duration of 1 second. Instead if you use plain Container you will not see the animation.

### AnimatedDefaultTextStyle 

Similar to AnimatedContainer, AnimatedDefaultTextStyle widget will animate the changes to the TextStyle. 

```dart

AnimatedDefaultTextStyle(
    duration: const Duration(milliseconds: 600),
    curve: Curves.linear,
    style: TextStyle(
        fontSize: _fontSize,
        color: _fontColor,
        fontWeight: FontWeight.bold,
    ),
    child: const Text("Flutter Rocks!"),
)
```
**Note:**  Changes to the variables *_fontSize*, *_fontColor* will animate the change for the duration of 600 milliseconds. 


