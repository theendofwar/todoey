import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/taskModel.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late String taskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Text(
                  'Add Task',
                  style: TextStyle(fontSize: 30, color: Colors.lightBlue),
                ),
                TextField(
                  autofocus: true,
                  textAlign: TextAlign.left,
                  onChanged: (value) {
                    setState(() {
                      taskTitle = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      fixedSize: Size.fromWidth(100),
                    ),
                    onPressed: () {
                      Provider.of<TaskModel>(context, listen: false)
                          .addTask(taskTitle);
                      Navigator.pop(context);
                    },
                    child: Text('Add',
                        style: TextStyle(fontSize: 30, color: Colors.white)))
              ],
            ),
          )),
    );
  }
}
