import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const ItemListPage());
  }
}

class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 768) {
            return ListData();
          }
          return GridData();
        },
      ),
    );
  }
}

class ListData extends StatelessWidget {
  const ListData({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, id) {
        return ListTile(
          leading: const Icon(Icons.add_box),
          title: Text("Item $id"),
        );
      },
    );
  }
}

class GridData extends StatelessWidget {
  const GridData({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(50, (index) {
        return Center(
          child: ListTile(
            leading: const Icon(Icons.add_box),
            title: Text("Item $index"),
          ),
        );
      }),
    );
  }
}

// // Example with out responsive design
// return Scaffold(
//       body: ListView.builder(
//         itemCount: 50,
//         itemBuilder: (context, id) {
//           return ListTile(
//             leading: const Icon(Icons.add_box),
//             title: Text("Item $id"),
//           );
//         },
//       ),
//     );
