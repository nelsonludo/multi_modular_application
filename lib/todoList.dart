import 'package:flutter/material.dart';

class MyToDoList extends StatelessWidget {
  final List<String> tasks;
  final Function addTaskFunction;
  final Function deleteTaskFunction;
  final void Function()? showAddTaskFunction;
  final bool displayAddTask;
  final String newTask;
  final Function setTask;

  MyToDoList(
      {required this.tasks,
      required this.addTaskFunction,
      required this.deleteTaskFunction,
      required this.showAddTaskFunction,
      required this.displayAddTask,
      required this.newTask,
      required this.setTask});

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
                  onPressed: () => deleteTaskFunction(task),
                  child: Text("Delete")),
              ElevatedButton(
                  onPressed: () => deleteTaskFunction(task),
                  child: Text("Edit"))
            ]);
          }),
          displayAddTask
              ? Column(children: [
                  TextField(
                    onChanged: (text) {
                      setTask(text);
                    },
                  ),
                  FloatingActionButton(
                    onPressed: () => addTaskFunction(newTask),
                    tooltip: 'Add',
                    child: Text("Add"),
                  )
                ])
              : FloatingActionButton(
                  onPressed: showAddTaskFunction,
                  tooltip: 'Add Task',
                  child: Text("Add Task"),
                )
        ],
      ),
    );
  }
}
