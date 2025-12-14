import 'package:flutter/material.dart';
import '../models/task.dart';


class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;


  const TaskTile({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
  });


  @override
  Widget build(BuildContext context) {
    return Dismissible( // swipe to delete
      key: ValueKey(task.title),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => onDelete(),
      child: CheckboxListTile(
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        value: task.isDone,
        onChanged: (_) => onToggle(),
      ),
    );
  }
}