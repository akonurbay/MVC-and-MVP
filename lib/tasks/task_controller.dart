import 'package:uuid/uuid.dart';

import 'task_model.dart';

class TaskController {
  List<TaskModel> tasks = [];

  void addTask(
    String title,
    String description,
  ) {
    String id = Uuid().v4();
    TaskModel newTask = TaskModel(
      id: id,
      title: title,
      description: description,
    );
    tasks.add(newTask);
  }

  void updateTask(
    String id,
    String title,
    String description,
    bool isDone,
  ) {
    final index = tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      tasks[index].title = title;
      tasks[index].description = description;
      tasks[index].isDone = isDone;
    }
  }

  void loadTasks() {
    // тестовые данные для ручного тестирования
    tasks = [
      TaskModel(id: Uuid().v4(), title: 'Задача 1', description: 'Описание 1'),
      TaskModel(id: Uuid().v4(), title: 'Задача 2', description: 'Описание 2'),
    ];
  }

  void deleteTask(String id) {
    tasks.removeWhere(
      (task) => task.id == id,
    );
  }

  List<TaskModel> getTasks() {
    return tasks;
  }
}
