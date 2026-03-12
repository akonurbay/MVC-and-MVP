import 'package:flutter/material.dart';
import 'package:hw_35/tasks/task_controller.dart';
import 'package:hw_35/tasks/task_model.dart';
import 'task_presenter.dart';
import 'task_view_interface.dart';

class TaskMvpScreen extends StatefulWidget {
  const TaskMvpScreen({super.key});

  @override
  State<TaskMvpScreen> createState() => _TaskMvpScreenState();
}

class _TaskMvpScreenState extends State<TaskMvpScreen>
    implements TaskViewInterface {
  late TaskPresenter presenter;
  List<TaskModel> _tasks = [];

  @override
  void initState() {
    super.initState();
    presenter = TaskPresenter(this, TaskController());
    presenter.loadTasks();
  }

  // презентер вызывает это → мы обновляем список на экране
  @override
  void showTasks(List<TaskModel> tasks) {
    setState(() {
      _tasks = tasks;
    });
  }

  // презентер вызывает это → мы показываем ошибку
  @override
  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Задачи MVP')),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          presenter.addTask('', 'Описание');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
