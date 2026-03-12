import 'package:hw_35/tasks/task_model.dart';

abstract class TaskViewInterface {
  void showTasks(List<TaskModel> tasks);
  void showError(String message);
}
