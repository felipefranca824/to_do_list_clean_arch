import 'package:dartz/dartz.dart';
import 'package:to_do_list_clean/src/app/cores/failures/failures.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/entities/task_entity.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/repositories/task_repository.dart';

abstract class IUpdateTaskUsecase {
  Future<Either<Failure, bool>> call({required TaskEntity taskEntity});
}

class UpdateTaskUsecase implements IUpdateTaskUsecase {
  final ITaskRepository repository;

  UpdateTaskUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call({required TaskEntity taskEntity}) async {
    return await repository.updateTask(taskEntity: taskEntity);
  }
}
