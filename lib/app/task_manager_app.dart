import 'package:flutter/material.dart';
import '../pages/task_list_page.dart';


class TaskManagerApp extends StatelessWidget { 
  const TaskManagerApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const TaskListPage(),
    );
  }
}