import 'package:flutter/material.dart';

class MyToDoList extends StatelessWidget {
  final List<String> tasks;
  final Function addTaskFunction;
  final Function deleteTaskFunction;
  final void Function()? showAddTaskFunction;
  final void Function()? unsetEditTask;
  final bool displayAddTask;
  final String newTask;
  final Function setTask;
  final Function updateTask;
  final Function showEditTaskFunction;
  final bool showEditTask;
  late TextEditingController controller;
  final String editedTask;

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
      required this.showEditTask,
      required this.controller,
      required this.editedTask,
      required this.unsetEditTask});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("To Do List"),
          ...(tasks).map((task) {
            return editedTask == task && showEditTask
                ? Container(
                    width: 400,
                    color: Colors.blue,
                    child: TextField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.red,
                        ),
                        controller: controller,
                        onSubmitted: (String value) =>
                            {updateTask(task, controller.text), unsetEditTask}),
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
                        onPressed: () => showEditTaskFunction(task),
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
