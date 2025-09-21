# 6.a) Create custom widgets for specific UI elements.

## Execution steps

```
flutter create lab_6a
cd lab_6a
    In the generated folder structure replace the content of lib/main.dart with the one given in this folder 
flutter run 
    choose chrome  
```

## Notes 

The Product widget is a custom Flutter widget that displays a product information.
This widget demonstrates how to create reusable UI components in Flutter by:
* Defining custom parameters (name, icon, price) 
* Style the components as needed.
* Add custom behaviour.
Once done, this component can be used as a widget in itself and can be composed as a child for other widgets.

```dart

class Product extends StatelessWidget {
  final String name;
  final IconData icon;
  final double price;

  const Product({
    required this.name,
    required this.icon,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children:[Icon(icon), Text(name), Text("$price")]);
  }
}

```

Demo usage - 

```dart

    Column(
        children: [
          Product(name: "Computer", icon: Icons.computer, price: 20000),
          Product(name: "Keyboard", icon: Icons.keyboard, price: 2000),
        ],
      )
```