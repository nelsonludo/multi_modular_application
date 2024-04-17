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
  late TextEditingController controller;

  MyToDoList({
    required this.tasks,
    required this.addTaskFunction,
    required this.deleteTaskFunction,
    required this.showAddTaskFunction,
    required this.displayAddTask,
    required this.newTask,
    required this.setTask,
    required this.updateTask,
    required this.showEditTaskFunction,
    required this.showEditTask,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("To Do List"),
          ...(tasks).map((task) {
            return showEditTask
                ? Container(
                    width: 400,
                    color: Colors.blue,
                    child: Row(children: [
                      TextField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.red,
                        ),
                        controller: controller,
                        onSubmitted: (String value) =>
                            updateTask(task, controller.text),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ]),
                  )
                : Container(
                    width: 400,
                    color: Colors.yellow,
                    child: Row(children: [
                      Text(task),
                      ElevatedButton(
                        onPressed: () => deleteTaskFunction(task),
                        child: const Text("Delete"),
                      ),
                      ElevatedButton(
                        onPressed: showEditTaskFunction,
                        child: const Text("Edit"),
                      )
                    ]),
                  );
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
                      child: const Text("Add"),
                    )
                  ]),
                )
              : Container(
                  width: 400,
                  child: FloatingActionButton(
                    onPressed: showAddTaskFunction,
                    tooltip: 'Add Task',
                    child: const Text("Add Task"),
                  ),
                ),
        ],
      ),
    );
  }
}
