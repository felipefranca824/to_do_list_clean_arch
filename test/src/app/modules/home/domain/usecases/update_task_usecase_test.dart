import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_list_clean/src/app/cores/failures/failures.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/entities/task_entity.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/repositories/task_repository.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/usecases/update_task_usecase.dart';

class MockTaskRepository extends Mock implements ITaskRepository {}

void main() {
  late IUpdateTaskUsecase usecase;
  late ITaskRepository repository;
  late final TaskEntity taskEntity;

  setUp(() {
    repository = MockTaskRepository();
    usecase = UpdateTaskUsecase(repository);
    taskEntity = TaskEntity(title: 'teste2', date: DateTime.now());
  });

  test('should return true if success', () async {
    when(() => repository.updateTask(taskEntity: taskEntity))
        .thenAnswer((_) async => const Right(true));

    final result = await usecase(taskEntity: taskEntity);

    expect(result, const Right(true));

    verify(() => repository.updateTask(taskEntity: taskEntity)).called(1);
  });

  test('should return Failure if success', () async {
    when(() => repository.updateTask(taskEntity: taskEntity))
        .thenAnswer((_) async => Left(UpdateTaskFailure(error: 'falha')));

    final result = await usecase(taskEntity: taskEntity);

    expect(result, Left(UpdateTaskFailure(error: 'falha')));

    verify(() => repository.updateTask(taskEntity: taskEntity)).called(1);
  });
}
