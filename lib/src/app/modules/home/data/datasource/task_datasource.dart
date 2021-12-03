import 'package:to_do_list_clean/src/app/modules/home/data/models/task_model.dart';

abstract class ITaskDatasource {
  Future<List<TaskModel>> getAllTasks();
  Future<bool> deleteTask({required TaskModel taskModel});
  Future<bool> saveTask({required TaskModel taskModel});
  Future<bool> updateTask({required TaskModel taskModel});
}
