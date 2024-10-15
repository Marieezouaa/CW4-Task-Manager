import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  VoidCallback onPressed;

  MyButton({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(buttonName),
      color: Theme.of(context).primaryColor,
    );
  }
}
