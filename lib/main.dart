import 'package:flutter/material.dart';
import 'tasks_mvp/task_mvp_screen.dart'; // или tasks/task_view.dart для MVC

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskMvpScreen(), // или TaskView()
    );
  }
}
