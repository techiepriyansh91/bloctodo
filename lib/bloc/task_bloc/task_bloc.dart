import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/task_model.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTaskEvent>((event, emit) {
      emit(state.copyWith(tasks: List.from(state.tasks)..add(event.task)));
    });

    on<DeleteTaskEvent>((event, emit) {
      emit(state.copyWith(tasks: state.tasks.where((task) => task.id != event.taskId).toList()));
    });

    on<RenameTaskEvent>((event, emit) {
      emit(state.copyWith(
        tasks: state.tasks.map((task) {
          if (task.id == event.taskId) {
            return Task(id: task.id, title: event.newTitle);
          }
          return task;
        }).toList(),
      ));
    });
  }
}
