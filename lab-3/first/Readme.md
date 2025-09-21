# 3.a) Design a responsive UI that adapts to different screen sizes.
## Responsive UI 

1. First create a new flutter project using the following command 

    ```
        flutter create lab_3a 
        cd lab_3a
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

Responsive apps automatically adapt to the size of the screen by rearranging the UI elements inorder to properly fill all the available space.

Below code is an example of a ListView it is always used in the vertical direction without taking into account the orientation of the screen. This is not a responsive usage at all:

```dart

    class ItemListPage extends StatelessWidget {
        const ItemListPage({super.key});

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                body: ListView.builder(
                    itemCount: 50,
                    itemBuilder: (context, id) {
                        return ListTile(
                            leading: const Icon(Icons.add_box),
                            title: Text("Item $id"),
                        );
                    },
                ),
            );
        }
    }

```

The LayoutBuilder widget gives information about the constraints of the parent such as the width and the height, using this we can rearrange the UI according to the available space, as shown in the example.

```dart

    class ItemListPage extends StatelessWidget {
        const ItemListPage({super.key});

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                body: LayoutBuilder(
                    builder: (context, constraints) {
                        
                        // if screen size is small then use list view or else use grid view. 

                        if (constraints.maxWidth < 768) {
                        
                            // Here ListData is a custom component which displays the items 
                            // in the single vertical column
                        
                            return ListData(); 
                        
                        }

                        // Here GridDta is a custom widget which displays the items 
                        // in a two column grid.
                        
                        return GridData();

                    },
                ),
            );
        }
    }

    class ListData extends StatelessWidget {.......}

    class GridData extends StatelessWidget {.......}
    
```