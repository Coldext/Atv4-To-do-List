import 'package:flutter/material.dart';
import '../models/task.dart';

class CompletedPage extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task) onDelete;

  const CompletedPage({
    super.key,
    required this.tasks,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarefas Completas')),
      body: tasks.isEmpty
          ? const Center(child: Text('Nenhuma tarefa completa'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (_, i) {
                final t = tasks[i];
                return ListTile(
                  title: Text(
                    t.title,
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => onDelete(t),
                  ),
                );
              },
            ),
    );
  }
}