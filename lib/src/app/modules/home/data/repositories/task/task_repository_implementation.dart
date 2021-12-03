import 'package:to_do_list_clean/src/app/cores/exceptions/exceptions.dart';
import 'package:to_do_list_clean/src/app/modules/home/data/datasource/task_datasource.dart';
import 'package:to_do_list_clean/src/app/modules/home/data/models/task_model.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/entities/task_entity.dart';
import 'package:to_do_list_clean/src/app/cores/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/repositories/task_repository.dart';

class TaskRepositoryImplementation implements ITaskRepository {
  final ITaskDatasource datasource;

  TaskRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, bool>> deleteTask({required TaskEntity taskEntity}) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasks() async {
    try {
      final result = await datasource.getAllTasks();
      return Right(result);
    } on GetAllTasksException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveTask(
      {required TaskEntity taskEntity}) async {
    try {
      final result = await datasource.saveTask(taskEntity: taskEntity);
      return Right(result);
    } on SaveTaskException {
      return Left(SaveTaskFailure(error: 'error'));
    }
  }

  @override
  Future<Either<Failure, bool>> updateTask({required TaskEntity taskEntity}) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
