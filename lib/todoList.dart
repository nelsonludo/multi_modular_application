import 'package:flutter/material.dart';

class MyToDoList extends StatelessWidget {
  final List<String> tasks;
  final Function addTaskFunction;
  final Function deleteTaskFunction;
  final void Function()? showAddTaskFunction;
  final bool displayAddTask;
  final String newTask;
  final Function setTask;
  final Function updateTask;
  final void Function()? showEditTaskFunction;
  final bool showEditTask;

  MyToDoList(
      {required this.tasks,
      required this.addTaskFunction,
      required this.deleteTaskFunction,
      required this.showAddTaskFunction,
      required this.displayAddTask,
      required this.newTask,
      required this.setTask,
      required this.updateTask,
      required this.showEditTaskFunction,
      required this.showEditTask});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("To Do List"),
          ...(tasks as List<String>).map((task) {
            TextEditingController _textEditingController =
                TextEditingController(text: task);
            var newTaskValue = "";
            return showEditTask
                ? Container(
                    width: 400,
                    color: Colors.blue,
                    child: Row(children: [
                      TextField(
                          decoration: InputDecoration(
                              filled: true, fillColor: Colors.red),
                          controller: _textEditingController,
                          onChanged: (text) {
                            newTaskValue = text;
                          }),
                      ElevatedButton(
                          onPressed: () => updateTask(task, newTaskValue),
                          child: Text("Edit Task"))
                    ]))
                : Container(
                    width: 400,
                    color: Colors.yellow,
                    child: Row(children: [
                      Text(task),
                      ElevatedButton(
                          onPressed: () => deleteTaskFunction(task),
                          child: Text("Delete")),
                      ElevatedButton(
                          onPressed: showEditTaskFunction, child: Text("Edit"))
                    ]));
          }),
          displayAddTask
              ? Container(
                  width: 400,
                  child: Column(children: [
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
                  ]))
              : Container(
                  width: 400,
                  child: FloatingActionButton(
                    onPressed: showAddTaskFunction,
                    tooltip: 'Add Task',
                    child: Text("Add Task"),
                  ))
        ],
      ),
    );
  }
}
