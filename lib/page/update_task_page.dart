import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/model/task.dart';
import 'package:todo_application/provider/tasks_provider.dart';
import 'package:todo_application/widgets/task_form_widget.dart';

class UpdateTaskPage extends StatefulWidget {
  final Task task;

  const UpdateTaskPage({Key? key, required this.task}) : super(key: key);

  @override
  _UpdateTaskPageState createState() => _UpdateTaskPageState();
}

class _UpdateTaskPageState extends State<UpdateTaskPage> {
  final _key = GlobalKey<FormState>();
  late String title;
  late String detail;

  @override
  void initState() {
    super.initState();
    title = widget.task.title;
    detail = widget.task.detail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: TaskFormWidget(
            title: title,
            detail: detail,
            onChangedTitle: (String title) {
              setState(() {
                this.title = title;
              });
            },
            onChangedDetail: (String detail) {
              setState(() {
                this.detail = detail;
              });
            },
            onSave: saveUpdate,
          ),
        ),
      ),
    );
  }

  void saveUpdate() {
    final isValid = _key.currentState?.validate();
    if (isValid == false) {
      return;
    } else {
      final provider = Provider.of<TasksProvider>(context, listen: false);
      provider.updateTask(widget.task, title, detail);

      Navigator.of(context).pop();

      Fluttertoast.showToast(
        msg: "Update task success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
      );
    }
  }
}
