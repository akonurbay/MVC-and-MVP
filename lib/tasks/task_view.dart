import 'package:flutter/material.dart';
import 'task_controller.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TaskController controller = TaskController();

  @override
  void initState() {
    super.initState();
    controller.loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Задачи')),
      body: ListView.builder(
        itemCount: controller.getTasks().length,
        itemBuilder: (context, index) {
          final task = controller.getTasks()[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: Checkbox(
              value: task.isDone,
              onChanged: (value) {
                setState(() {
                  controller.updateTask(
                    task.id,
                    task.title,
                    task.description,
                    value ?? false,
                  );
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            controller.addTask(
              'Новая задача',
              'Описание',
            );
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
