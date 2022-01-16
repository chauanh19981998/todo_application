import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/model/task.dart';
import 'package:todo_application/provider/tasks_provider.dart';
import 'package:todo_application/widgets/task_form_widget.dart';

class AddTaskDialogWidget extends StatefulWidget {
  @override
  _AddTaskDialogWidgetState createState() => _AddTaskDialogWidgetState();
}

class _AddTaskDialogWidgetState extends State<AddTaskDialogWidget> {
  final _key = GlobalKey<FormState>();
  String title = '';
  String detail = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Add Task",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            TaskFormWidget(
              onChangedTitle: (title) {
                setState(() {
                  this.title = title;
                });
              },
              onChangedDetail: (detail) {
                setState(() {
                  this.detail = detail;
                });
              },
              onSave: addTask,
            )
          ],
        ),
      ),
    );
  }

  void addTask() {
    final isValid = _key.currentState?.validate();

    if (isValid == false) {
      return;
    } else {
      final task = Task(
        id: DateTime.now().toString(),
        title: title,
        detail: detail,
      );

      final provider = Provider.of<TasksProvider>(context, listen: false);
      provider.addTask(task);

      Navigator.of(context).pop();

      Fluttertoast.showToast(
        msg: "Add task success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
      );
    }
  }
}
