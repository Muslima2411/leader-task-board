import 'package:task_management_app/src/data/entity/task_model.dart';

abstract class AppRepository {
  Future<Map<String, List<TaskModel>>?> getAllInfo();
}
