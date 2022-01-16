import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/provider/tasks_provider.dart';
import 'package:todo_application/widgets/task_widget.dart';

class TaskListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TasksProvider>(context);
    final tasks = provider.tasks;

    return tasks.isEmpty
        ? const Center(
            child: Text(
              "No Task",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final task = tasks[index];

              return TaskWidget(task: task);
            },
            itemCount: tasks.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 12,
              );
            },
          );
  }
}
