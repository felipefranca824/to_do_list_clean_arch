import 'package:dartz/dartz.dart';
import 'package:to_do_list_clean/src/app/cores/failures/failures.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/entities/task_entity.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/repositories/task_repository.dart';

abstract class IDeleteTaskUsecase {
  Future<Either<Failure, bool>> call({required TaskEntity taskEntity});
}

class DeleteTaskUsecase implements IDeleteTaskUsecase {
  final ITaskRepository repository;

  DeleteTaskUsecase(this.repository);
  @override
  Future<Either<Failure, bool>> call({required TaskEntity taskEntity}) async {
    return await repository.deleteTask(taskEntity: taskEntity);
  }
}
