import 'package:to_do_list_clean/src/app/modules/home/data/models/task_model.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/entities/task_entity.dart';

abstract class ITaskDatasource {
  Future<List<TaskModel>> getAllTasks();
  Future<bool> deleteTask({required TaskEntity taskEntity});
  Future<bool> saveTask({required TaskEntity taskEntity});
  Future<bool> updateTask({required TaskEntity taskEntity});
}
