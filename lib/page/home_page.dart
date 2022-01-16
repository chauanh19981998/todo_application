import 'package:flutter/material.dart';
import 'package:todo_application/widgets/add_task_dialog_widget.dart';
import 'package:todo_application/widgets/complete_task_widget.dart';
import 'package:todo_application/widgets/incomplete_task_widget.dart';
import 'package:todo_application/widgets/task_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bottomTaps = [
      TaskListWidget(),
      CompleteTaskListWidget(),
      InCompleteTaskListWidget()
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: selectIndex,
        onTap: (index) {
          setState(() {
            selectIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.task_outlined), label: 'All'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Complete'),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Incomplete')
        ],
      ),
      body: bottomTaps[selectIndex],
      floatingActionButton: FloatingActionButton(
        key: const Key('add'),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddTaskDialogWidget();
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
