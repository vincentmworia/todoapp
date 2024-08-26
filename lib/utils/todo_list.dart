import 'dart:ui';

import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList(
      {super.key,
      required this.appColor,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  final Color appColor;
  final String taskName;
  final bool taskCompleted;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
        bottom: 0.0,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: appColor, borderRadius: BorderRadius.circular(15.0)),
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              checkColor: Colors.black,
              activeColor: Colors.white,
              side: const BorderSide(color: Colors.white),
            ),
            Text(
              taskName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationColor: Colors.white,
                decorationThickness: 2.0
              ),
            ),
          ],
        ),
      ),
    );
  }
}
