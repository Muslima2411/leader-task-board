import 'package:flutter/foundation.dart';

import '../../../data/entity/task_model.dart';

@immutable
abstract class TaskState {
  const TaskState();
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final Map<String, List<TaskModel>> tasks;

  const TaskLoaded(this.tasks);
}

class TaskError extends TaskState {
  final String message;

  const TaskError(this.message);
}
