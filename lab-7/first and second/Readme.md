# 7.a) Design a form with various input fields. and 7.b) Implement form validation and error handling.



## Execution steps

```
flutter create lab7
cd lab7
    In the generated folder structure replace the content of lib/main.dart with the one given in this folder 
flutter run 
    choose chrome  
```

## Notes

Code Breakdown – Simple Flutter Form

1. Form Creation
    * Use the Form widget to group input fields (TextFormField, DropdownButtonFormField, etc.).
        ```dart
            Form(
                key: _formKey,
                child: Column(
                    children: [
                        // Name Field
                        TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(labelText: 'Name'),
                            validator: (value) =>
                                value!.isEmpty ? 'Please enter your name' : null,
                        )
                        ....
                    ]
                )
            ); 
        ```

    * Assign a GlobalKey<FormState> to the form for accessing validation and saving methods. 
        - It provides a unique handle to the Form widget.
        - It allows direct access to the form’s state anywhere in your widget tree.
        - Enables use of methods like validate(), save(), and reset() on the associated form.
        - Usage:
            - Create a single instance: 
                ```dart 
                    final _formKey = GlobalKey<FormState>(); 
                ```
            - Pass it to the Form widget: 
                ```dart 
                    Form(key: _formKey, ...) 
                ```
            - Call 
                ```dart 
                    _formKey.currentState!.validate() 
                ``` 
            to run all field validators.

2. TextEditingController
    * Purpose:
        - Controls and retrieves the current value of a text field.
    * How it works:
        - Provides access to the text being edited in TextField or TextFormField.
        - Can set text programmatically and listen for changes.
    * Usage:
        - Declare and initialize: 
            ```dart 
                final nameController = TextEditingController();
            ```
        - Attach to a field: 
            ```dart 
                TextFormField(controller: nameController, ...) 
            ```
        - Retrieve or set value: 
            ```dart
                nameController.text
            ```
        - Dispose of it when no longer used to free resources.

2. Validation
    * Attach a validator function to each field (via validator: parameter).

        ```dart

            TextFormField(
                .....
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your name' : null,
            )

        ```

    * The validator checks the entered value and returns an error message if invalid (or null if valid).

    * Trigger validation using 
        ``` 
           formKey.currentState!.validate(); 
        ``` 
    this will run all field validators. 

3. Submission
    * Wrap the submit logic in a button (e.g. ElevatedButton).
    * On submit, call validate()—if valid, proceed (display a success message, send data, etc.).
    * If not valid, error messages will appear below the respective invalid fields.

4. ScaffoldMessenger.of(context).showSnackBar(....)
    * Displays the message at the bottom.



