import 'package:dartz/dartz.dart';
import 'package:to_do_list_clean/src/app/cores/failures/failures.dart';
import 'package:to_do_list_clean/src/app/modules/home/data/models/task_model.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/entities/task_entity.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/repositories/task_repository.dart';

abstract class ISaveTaskUsecase {
  Future<Either<Failure, bool>> call(TaskModel taskModel);
}

class SaveTaskUsecase implements ISaveTaskUsecase {
  final ITaskRepository repository;

  SaveTaskUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(TaskEntity taskEntity) async {
    return await repository.saveTask(taskEntity: taskEntity);
  }
}
