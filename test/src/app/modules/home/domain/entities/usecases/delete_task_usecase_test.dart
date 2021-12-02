import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_list_clean/src/app/cores/failures/failures.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/entities/task_entity.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/repositories/task_repository.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/usecases/delete_task_usecase.dart';

class MockTaskRepository extends Mock implements ITaskRepository {}

void main() {
  late IDeleteTaskUsecase usecase;
  late ITaskRepository repository;
  late final TaskEntity taskEntity;

  setUp(() {
    repository = MockTaskRepository();
    usecase = DeleteTaskUsecase(repository);
    taskEntity = TaskEntity(title: 'testando', date: DateTime.now());
  });

  test('should return true if success', () async {
    when(() => repository.deleteTask(taskEntity: taskEntity))
        .thenAnswer((_) async => const Right(true));

    final result = await usecase(taskEntity: taskEntity);

    expect(result, const Right(true));

    verify(() => repository.deleteTask(taskEntity: taskEntity)).called(1);
  });

  test('should return false if don\'t success', () async {
    when(() => repository.deleteTask(taskEntity: taskEntity))
        .thenAnswer((_) async => Left(DeleteTaskFailure(error: 'error')));

    final result = await usecase(taskEntity: taskEntity);

    expect(result, Left(DeleteTaskFailure(error: 'error')));

    verify(() => repository.deleteTask(taskEntity: taskEntity)).called(1);
  });
}
