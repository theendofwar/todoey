import 'package:flutter/cupertino.dart';
import 'package:todoey/model/task.dart';

class TaskModel extends ChangeNotifier {
  List<Task> _taskList = [
    Task(name: 'task1'),
    Task(name: 'task2'),
    Task(name: 'task3'),
  ];

  int get taskCount => _taskList.length;

  List<Task> get taskList => List.unmodifiable(_taskList);

  void addTask(String taskName) {
    _taskList.add(Task(name: taskName));
    print(_taskList);
    notifyListeners();
  }

  void checkTaskOff(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _taskList.remove(task);
    notifyListeners();
  }
}
