import 'package:flutter/material.dart';

class MyToDoList extends StatelessWidget {
  final List<String> tasks;
  final Function addTaskFunction;
  final Function deleteTaskFunction;

  MyToDoList(
      {required this.tasks,
      required this.addTaskFunction,
      required this.deleteTaskFunction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("To Do List"),
          ...(tasks as List<String>).map((task) {
            return Row(children: [
              Text(task),
              ElevatedButton(
                  onPressed: deleteTaskFunction(task), child: Text("Delete"))
            ]);
          }),
          FloatingActionButton(
            onPressed: () => addTaskFunction("do the laundry"),
            tooltip: 'Add Task',
            child: Text("Add Task"),
          ),
        ],
      ),
    );
  }
}
