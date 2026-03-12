class TaskModel {
  String id;
  String title;
  String description;
  bool isDone;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });
}
