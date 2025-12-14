import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';


class TaskStorageService {
  static const _tasksKey = 'tasks';


  Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_tasksKey);


    if (jsonString == null) return [];


    final List decoded = jsonDecode(jsonString);
    return decoded.map((e) => Task.fromJson(e)).toList();
  }


  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(
      tasks.map((t) => t.toJson()).toList(),
    );
    await prefs.setString(_tasksKey, jsonString);
  }
}