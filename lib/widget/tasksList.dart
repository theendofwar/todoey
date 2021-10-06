import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/taskModel.dart';
import 'package:todoey/widget/taskTile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(builder: (context, taskData, child) {
      return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            return Slidable(
              actionPane: SlidableDrawerActionPane(),
              actions: [
                IconSlideAction(
                  icon: CupertinoIcons.pen,
                  caption: "Edit",
                  color: Colors.green,
                )
              ],

              secondaryActions: [
                IconSlideAction(
                  icon: CupertinoIcons.trash,
                  caption: "Delete",
                  color: Colors.red,
                  onTap: (){
                    taskData.deleteTask(taskData.taskList[index]);
                  },
                )
              ],
              child: TaskTile(
                name: taskData.taskList[index].name,
                isChecked: taskData.taskList[index].isDone,
                checkboxCallback: (bool checkboxState) {
                  taskData.checkTaskOff(taskData.taskList[index]);
                }, onLongPress: () { },
              ),
            );
          });
    });
  }
}
