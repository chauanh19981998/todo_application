import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/model/task.dart';
import 'package:todo_application/page/update_task_page.dart';
import 'package:todo_application/provider/tasks_provider.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  const TaskWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
        key: Key(task.id),
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (BuildContext context) {
              updateTask(context, task);
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Update',
          ),
          SlidableAction(
            onPressed: (BuildContext context) {
              deleteTask(context, task);
            },
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ]),
        child: buildTask(context));
  }

  Widget buildTask(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(
              value: task.isDone,
              onChanged: (_) {
                final provider =
                    Provider.of<TasksProvider>(context, listen: false);
                final complete = provider.changeTaskStatus(task);

                Fluttertoast.showToast(
                  msg: complete ? "Complete" : "InComplete",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                );
              }),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.red),
              ),
              task.detail.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        task.detail,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    )
                  : Container()
            ],
          ))
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
    );
  }

  void deleteTask(BuildContext context, Task task) {
    final provider = Provider.of<TasksProvider>(context, listen: false);
    provider.removeTask(task);

    Fluttertoast.showToast(
      msg: "Delete task",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
    );
  }

  void updateTask(BuildContext context, Task task) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return UpdateTaskPage(task: task);
    }));
  }
}
