# 10.b) Use Flutter's debugging tools to identify and fix issues.

## Execution Steps

```

flutter create lab10b

cd lab10b
    In the generated folder structure replace the content of lib/main.dart with the one given in the lib\ folder 

flutter run --debug

```

**Note** - Here `--debug` will open the app in debug mode. You should find the DevTools debugger and profiler link in the command line. Copy the devtools url from terminal and paste it in the browser window for debugging. Or else if you are running this from VS Code you will get an option to open dev tools which you can use to achieve the same. For opening dev tools in VS Code

```
    Ctrl + Shift + p
    Flutter: Open DevTools
```

## Notes 

Flutter provides a comprehensive set of debugging tools to help developers identify, diagnose, and fix issues efficiently. Here are the key Flutter debugging tools and their functionalities:

### 1.Flutter DevTools:

Key features and benefits of running in debug mode:

#### Hot Reload:
This allows you to instantly see the effects of code changes without restarting the application, significantly speeding up development.

#### Error Checking:
The application performs more extensive error checking and provides detailed error messages, aiding in bug identification.

#### Step-by-step Debugging:
You can set breakpoints and step through your code line by line, inspecting variable values and understanding the execution flow. This is crucial for pinpointing the source of issues.

#### Performance Monitoring (with DevTools):
While debug mode performance is not representative of release mode, it enables the use of Flutter DevTools for detailed performance analysis, including CPU usage, memory allocation, and UI rendering.

#### Widget Inspector:
This tool, accessible through DevTools, allows you to visualize the widget tree and inspect the properties of individual widgets, assisting in UI layout and debugging.




