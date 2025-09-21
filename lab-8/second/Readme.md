# 8.b) Experiment with different types of animations (fade, slide, etc.).

## Execution steps

```
flutter create lab8b
cd lab8b
    In the generated folder structure replace the content of lib/main.dart with the one given in this folder 
flutter run 
    choose chrome  
```

## Notes

### 1. AnimationController

* It is a special animation object that controls the animation.
* Manages the animation's duration, playback, and state (forward, reverse, stopped).
* Provides a vsync parameter to optimize resource usage by syncing with the screen refresh rate, preventing offscreen animations from consuming battery.
* In the example, _slideController drives the slide animation's timing and progress over 500 milliseconds.
* Methods like .forward() and .reverse() start and reverse the animation respectively.

```dart

// Slide Animation Setup
_slideController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
);

```

### 2. Tween<T>

* Stands for "Tweening," which means generating intermediate frames between two values to create smooth animations.
* Defines the start (begin) and end (end) values for an animation property.
* The generic type T could be something like double, Color, or, as in this case, Offset.
* In the example, Tween<Offset> animates a widget's position from an offset of (-1.0, 0.0) (off-screen to the left) to Offset.zero (original position).

### 3. CurvedAnimation

* Wraps another animation (usually an AnimationController) to apply non-linear motion curves like easing, bounce, or acceleration.
* Controls the rate of change of the animation to make it look more natural.
* In the example, Curves.easeInOut is used for smooth, gradual acceleration and deceleration of the slide.


```dart

_slideAnimation = 
    Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero)
       .animate(
            CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
        );

```

### 4. Animation<Offset>

* Represents the animated value at a given frame.
* The Tween combined with AnimationController produces this animated output.
* Used as the input to SlideTransition to move the widget along the specified offset.

### 5. SlideTransition

* A widget that transitions its child by changing its position.
* It takes an Animation<Offset> as its position argument and moves the child widget accordingly.
* Here, it uses the _slideAnimation to slide the green box horizontally.

```dart

SlideTransition(
    position: _slideAnimation,
    child: Container(....)
)

```

### 6. SingleTickerProviderStateMixin

* A mixin on the State class providing a single ticker (frame callback) for animation controllers.
* Ensures the AnimationController stays in sync with the device's screen refresh rate.
* Essential for efficient animation.

```dart

class _AnimationDemoScreenState extends State<AnimationDemoScreen>
    with SingleTickerProviderStateMixin {
        ...
}

```