import 'package:flutter/material.dart';
import 'package:taskmanger/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;

 DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 249, 219, 189),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get new task
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add new task"),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  buttonName: "Save",
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 5,
                ),
                MyButton(
                  buttonName: "Cancel",
                  onPressed: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
