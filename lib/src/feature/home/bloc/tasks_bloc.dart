import 'package:bloc/bloc.dart';
import 'package:task_management_app/src/data/repository/app_repository_impl.dart';
import 'package:task_management_app/src/feature/home/bloc/tasks_event.dart';
import 'package:task_management_app/src/feature/home/bloc/tasks_state.dart';

class TaskBloc extends Bloc<TasksEvent, TaskState> {
  final AppRepositoryImpl appRepository;

  TaskBloc(this.appRepository) : super(TaskInitial()) {
    on<GetTasks>((event, emit) async {
      emit(TaskLoading());
      try {
        final tasks = await appRepository.getAllInfo(); // Fetch tasks
        emit(TaskLoaded(tasks!)); // Emit loaded state
      } catch (e) {
        emit(TaskError(e.toString())); // Emit error state
      }
    });
  }
}
