import 'package:to_do_list_clean/src/app/cores/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/entities/task_entity.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/repositories/task_repository.dart';

abstract class IGetAllTaskUsecase {
  Future<Either<Failure, List<TaskEntity>>> call();
}

class GetAllTasksUsecase implements IGetAllTaskUsecase {
  ITaskRepository repository;

  GetAllTasksUsecase(this.repository);

  @override
  Future<Either<Failure, List<TaskEntity>>> call() async {
    return await repository.getAllTasks();
  }
}
