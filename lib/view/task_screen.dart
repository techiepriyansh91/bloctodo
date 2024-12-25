import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/task_bloc/task_bloc.dart';
import '../bloc/task_bloc/task_event.dart';
import '../bloc/task_bloc/task_state.dart';
import '../model/task_model.dart';


class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task Manager")),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks[index];
              return ListTile(
                title: InkWell(
                  onTap: (){
                    _showRenameDialog(context, task);
                  },
                    child: Text(task.title)),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    context.read<TaskBloc>().add(DeleteTaskEvent(taskId: task.id));
                  },
                ),
                onTap: () {

                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newTask = Task(id: DateTime.now().toString(), title: "New Task");
          context.read<TaskBloc>().add(AddTaskEvent(task: newTask));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showRenameDialog(BuildContext context, Task task) {
    final TextEditingController controller = TextEditingController(text: task.title);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Rename Task"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: "New Task Name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                final newTitle = controller.text.trim();
                if (newTitle.isNotEmpty) {
                  context.read<TaskBloc>().add(
                    RenameTaskEvent(taskId: task.id, newTitle: newTitle),
                  );
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Rename"),
            ),
          ],
        );
      },
    );
  }

}
