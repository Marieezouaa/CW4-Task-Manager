import 'package:flutter/material.dart';
import 'package:taskmanger/util/dialog_box.dart';
import 'package:taskmanger/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    ["Do homework", false],
    ["Go to class", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear(); //to remove prev task text
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 165, 171),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(219, 218, 98, 125),
        title: Text("TODO"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(219, 194, 76, 101),
          onPressed: createNewTask, child: const Icon(Icons.add)),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return Container(
            child: SingleChildScrollView(
              child: TodoTile(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFuction: (p0) => deleteTask(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
