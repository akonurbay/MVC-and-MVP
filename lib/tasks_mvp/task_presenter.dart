import 'package:hw_35/tasks/task_controller.dart';
import 'package:hw_35/tasks_mvp/error_handler.dart';
import 'task_view_interface.dart';

// MVC vs MVP:
// Стало проще: бизнес-логика полностью отделена от UI, легче тестировать
// Стало сложнее: больше файлов, нужен интерфейс для связи с UI

class TaskPresenter {
  final TaskViewInterface view;
  final TaskController controller;

  TaskPresenter(this.view, this.controller);

  void loadTasks() {
    final tasks = controller.getTasks();
    view.showTasks(tasks);
  }

  void addTask(String title, String description) {
    final error = ErrorHandler.validate(title);
    if (error != null) {
      view.showError(error);
      return;
    }
    controller.addTask(title, description);
    loadTasks();
  }

  void updateTask(String id, String title, String description, bool isDone) {
    controller.updateTask(id, title, description, isDone);
    loadTasks();
  }

  void deleteTask(String id) {
    controller.deleteTask(id);
    loadTasks();
  }
}
