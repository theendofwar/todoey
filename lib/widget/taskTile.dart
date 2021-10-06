import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    required this.name,
    required this.isChecked,
    required this.checkboxCallback, required this.onLongPress,
  }) ;
  final String name;
  final bool isChecked;
  final Function checkboxCallback;
  final void Function() onLongPress;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        name,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        onChanged: (value) {
          checkboxCallback(value);
        },
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
      ),
    );
  }
}
