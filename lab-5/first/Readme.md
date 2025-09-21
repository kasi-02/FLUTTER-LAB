# 5.a) Learn about stateful and stateless widgets.

## Stateless and Stateful widgets

## Execution steps
```
        flutter create lab_5a2
        cd lab_5a2
            In the generated folder structure replace the content of lib/main.dart with the one given in this folder 
        flutteImplement navigation with named routes.r run 
            choose chrome  
```

## Stateless widget 
Use this kind of widget when you need to create a piece of UI that is not going to change over the time.

```dart

    class MyInfo extends StatelessWidget {
        // Notice the constant constructor
        const MyInfo();
    
        @override
        Widget build(BuildContext context) {
            return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                        Icon(Icons.person),
                        Text("Flutter developer"),
                    ]
            );
        }
    }
```

## Stateful widget

Stateful widget. Use this kind of widget when you need to create a piece of UI that is
going to change over the time. In this case the UI is going to dynamically change due to
external events such as the received response of an HTTP request or the callback triggered
by a button tap.

1. Counter is the widget itself and thus it’s inserted in the widget tree; _CounterState
is the mutable state of the Counter widget. When Flutter rebuilds the widget tree to
refresh the UI, the build(...) method of State<T> is called.

2. Subclasses of State<T> gain access to the setState(...) method which rebuilds the
widget (it’s like a refreshing tool).

```dart

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<StatefulWidget> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$_counter'),
        SizedBox(width: 40),
        IconButton(
          onPressed: () {
            // With out setState the widget is not rebuilt and you won't see the change in the value.
            setState(() => _counter++);
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
```