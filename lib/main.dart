import 'package:flutter/material.dart';
import './todoList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _page = "Home";
  String _newTask = "";
  bool _displayAddTaskPanel = false;
  bool _showEditTask = false;
  var _taskList = ["Change the light bulbs", "beat my meat"];

  void _displayPage(String value) {
    setState(() {
      _page = value;
    });
  }

  void _displayEditTask() {
    setState(() {
      _showEditTask = true;
    });
  }

  void _addTask(String value) {
    print(value);
    setState(() {
      _taskList = [..._taskList, value];
      _displayAddTaskPanel = false;
    });
  }

  void _editTask(String currentTask, String value) {
    setState(() {
      _taskList = [
        ..._taskList.map((task) {
          if (task == currentTask) {
            return value;
          } else {
            return task;
          }
        })
      ];
    });
  }

  void _deleteTask(String value) {
    setState(() {
      _taskList = _taskList.where((task) => task != value).toList();
    });
  }

  void _displayAddPanel() {
    setState(() {
      _displayAddTaskPanel = true;
    });
  }

  void _setTask(String value) {
    setState(() {
      _newTask = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome to the multi modular application',
              ),
              Row(
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () => _displayPage("To Do"),
                    tooltip: 'To Do List',
                    child: Text("To Do List"),
                  ),
                  FloatingActionButton(
                    onPressed: () => _displayPage("Calculator"),
                    tooltip: 'Calculator',
                    child: Text("Calculator"),
                  ),
                ],
              ),
              MyToDoList(
                tasks: _taskList,
                addTaskFunction: _addTask,
                deleteTaskFunction: _deleteTask,
                showAddTaskFunction: _displayAddPanel,
                newTask: _newTask,
                displayAddTask: _displayAddTaskPanel,
                setTask: _setTask,
                updateTask: _editTask,
              ),
            ]),
      ),
    );
  }
}
