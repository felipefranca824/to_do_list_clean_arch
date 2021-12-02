import 'package:dartz/dartz.dart';
import 'package:to_do_list_clean/src/app/cores/failures/failures.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/entities/task_entity.dart';

abstract class ITaskRepository {
  Future<Either<Failure, List<TaskEntity>>> getAllTasks();
}
