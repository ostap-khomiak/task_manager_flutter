import 'package:flutter/material.dart';
import '../widgets/task_tile.dart';
import '../models/task.dart';
import '../services/task_storage_service.dart';



class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}


class _TaskListPageState extends State<TaskListPage> {
  final TaskStorageService _storage = TaskStorageService();
  List<Task> _tasks = [];
  final TextEditingController _controller = TextEditingController();

  @override
    void initState() {
      super.initState();
    _loadTasks();
  }


  Future<void> _loadTasks() async {
    final loaded = await _storage.loadTasks();
    setState(() => _tasks = loaded);
  }

  Future<void> _save() async {
    await _storage.saveTasks(_tasks);
  }

  void _addTask() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _tasks.add(Task(title: text));
      _controller.clear();
    });
    _save();
  } 

  void _toggleTask(int index) {
    setState(() {
      _tasks[index].isDone = !_tasks[index].isDone;
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Manager')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'New task',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _addTask(),
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: _addTask,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),

          Expanded(
            child: _tasks.isEmpty ? const Center(child: Text('No tasks yet')) : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  task: _tasks[index],
                  onToggle: () => _toggleTask(index),
                  onDelete: () => _removeTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}