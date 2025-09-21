# 9.a) Fetch data from a REST API. (AND) b) Display the fetched data in a meaningful way in the UI.

## Execution steps

```
flutter create lab9
cd lab9
    In the generated folder structure replace the content of lib/main.dart with the one given in this folder 
```

### IMPORTANT NOTE - 

Add the following 

```
 http: ^0.13.0 
``` 

(or the latest version) to your **pubspec.yaml** dependencies and run 

```
flutter pub get
```

Then run the app on an emulator or device.

```
flutter run 
```

## Notes

### Summary 

The example uses the http package in Flutter to make an HTTP GET request to a public REST API (https://jsonplaceholder.typicode.com/posts). This involves:

* Importing the http package.
* Writing an asynchronous function that performs an HTTP GET request using http.get().
* Parsing the JSON response into Dart objects.
* Handling the response status to ensure correct data fetching or error handling.

### Import http 

```dart
import 'package:http/http.dart' as http;
```

### Asynchronous fetch using http.get()

```dart

Future<List<Post>> fetchPosts() async {

  // fetch the response from http endpoint and wait for the response.    
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  // if successful 
  if (response.statusCode == 200) {
    
    // Decode JSON response body
    List jsonResponse = json.decode(response.body);
    
    // For each JSON object from the response list => map it to Post object
    // and collect the result as a list of Post objects.
    
    return jsonResponse.map((post) => Post.fromJson(post)).toList();

  } else {
    // Throw an exception in case of error
    throw Exception('Failed to load posts');
  }
}

```

* http.get(Uri.parse(url)) sends a GET request to the specified URL.
* Response returned contains statusCode and body.
* If statusCode is 200, the response body is decoded from JSON.
* The data is converted to a list of Post objects for easier use in the app.
* Errors are handled by throwing exceptions for failed requests.


### FutureBuilder

* The `Future<List<Post>>` returned by fetchPosts is used inside a FutureBuilder to update the UI based on request state (loading, error, or loaded data).

* Wait for and display API fetched data asynchronously.

```dart

FutureBuilder<List<Post>>(
  future: fetchPosts(),  // <=== fetchPosts() will make the API call 
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else if (snapshot.hasData) {
      return ListView(...); // <=== present the data in the UI 
    } else {
      return Text('No data found');
    }
  },
)

```

### ListView.builder

* Creates a scrollable, linear array of widgets that are built lazily.
* Displays the list of posts dynamically.

```dart

ListView.builder(
  itemCount: posts.length,
  itemBuilder: (context, index) {   // <=== for each item/object 
    return ListTile(
      title: Text(posts[index].title),
      subtitle: Text(posts[index].body),
    );
  },
)

```