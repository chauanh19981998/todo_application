import 'package:flutter/cupertino.dart';
import 'package:todo_application/model/task.dart';

class TasksProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: 'Morning', detail: 'exercise', id: '0'),
    Task(title: 'Afternoon', detail: 'lunch', id: '1'),
    Task(title: 'Evening', detail: 'go home', id: '2'),
  ];

  //list all task
  List<Task> get tasks =>
      _tasks.where((task) => task.title.isNotEmpty).toList();

  //list complete task
  List<Task> get tasksComplete =>
      _tasks.where((task) => task.isDone == true).toList();

  //list incomplete task
  List<Task> get tasksInComplete =>
      _tasks.where((task) => task.isDone == false).toList();

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  bool changeTaskStatus(Task task) {
    task.isDone = !task.isDone;
    notifyListeners();

    return task.isDone;
  }

  void updateTask(Task task, String title, String detail) {
    task.title = title;
    task.detail = detail;
    notifyListeners();
  }
}
