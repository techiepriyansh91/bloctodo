import 'package:equatable/equatable.dart';

import '../../model/task_model.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final Task task;

  AddTaskEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class DeleteTaskEvent extends TaskEvent {
  final String taskId;

  DeleteTaskEvent({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}

class RenameTaskEvent extends TaskEvent {
  final String taskId;
  final String newTitle;

  RenameTaskEvent({required this.taskId, required this.newTitle});

  @override
  List<Object?> get props => [taskId, newTitle];
}
