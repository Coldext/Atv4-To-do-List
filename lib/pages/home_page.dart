import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';
import '../widgets/section_header.dart';
import '../widgets/empty_message.dart';
import 'completed_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> _tasks = [];
  final _controller = TextEditingController();

  List<Task> get _todoTasks =>
      _tasks.where((t) => t.status == TaskStatus.todo).toList();
  List<Task> get _doingTasks =>
      _tasks.where((t) => t.status == TaskStatus.doing).toList();
  List<Task> get _doneTasks =>
      _tasks.where((t) => t.status == TaskStatus.done).toList();

  void _addTask() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _tasks.add(Task(title: text));
      _controller.clear();
    });
  }

  void _deleteTask(Task task) {
    setState(() => _tasks.remove(task));
  }

  void _advanceStatus(Task task) {
    setState(() {
      if (task.status == TaskStatus.todo) {
        task.status = TaskStatus.doing;
      } else if (task.status == TaskStatus.doing) {
        task.status = TaskStatus.done;
      }
    });
  }

  void _editTask(Task task) {
    final editController = TextEditingController(text: task.title);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Editar Tarefa'),
        content: TextField(
          controller: editController,
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              final newTitle = editController.text.trim();
              if (newTitle.isNotEmpty) {
                setState(() => task.title = newTitle);
              }
              Navigator.pop(ctx);
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_circle_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CompletedPage(
                    tasks: _doneTasks,
                    onDelete: (t) => setState(() => _tasks.remove(t)),
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          // Input
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (_) => _addTask(),
                    decoration: const InputDecoration(
                      hintText: 'Nova tarefa...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTask,
                )
              ],
            ),
          ),

          // Listas
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                SectionHeader(
                  title: 'A Fazer',
                  count: _todoTasks.length,
                  color: cs.primary,
                ),
                if (_todoTasks.isEmpty)
                  const EmptyMessage('Nenhuma tarefa'),
                ..._todoTasks.map((t) => TaskCard(
                      task: t,
                      statusLabel: 'A Fazer',
                      statusColor: cs.primary,
                      onAdvance: () => _advanceStatus(t),
                      onEdit: () => _editTask(t),
                      onDelete: () => _deleteTask(t),
                    )),

                const SizedBox(height: 20),

                SectionHeader(
                  title: 'Fazendo',
                  count: _doingTasks.length,
                  color: Colors.orange,
                ),
                if (_doingTasks.isEmpty)
                  const EmptyMessage('Nenhuma tarefa'),
                ..._doingTasks.map((t) => TaskCard(
                      task: t,
                      statusLabel: 'Fazendo',
                      statusColor: Colors.orange,
                      onAdvance: () => _advanceStatus(t),
                      onEdit: () => _editTask(t),
                      onDelete: () => _deleteTask(t),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}