import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_list_clean/src/app/cores/failures/failures.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/entities/task_entity.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/repositories/task_repository.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/usecases/save_task_usecase.dart';

class MockTaskRepository extends Mock implements ITaskRepository {}

void main() {
  late SaveTaskUsecase usecase;
  late ITaskRepository repository;
  late final TaskEntity taskEntity;

  setUp(() {
    repository = MockTaskRepository();
    usecase = SaveTaskUsecase(repository);
    taskEntity = TaskEntity(title: 'Teste', date: DateTime.now(), id: '1');
  });

  test('should return a TaskEntity if success', () async {
    when(() => repository.saveTask(taskEntity: taskEntity))
        .thenAnswer((_) async => const Right(true));

    final result = await usecase(taskEntity);

    expect(result, const Right(true));

    verify(() => repository.saveTask(taskEntity: taskEntity)).called(1);
  });

  test('should return a Failure if don\'t success', () async {
    when(() => repository.saveTask(taskEntity: taskEntity))
        .thenAnswer((_) async => Left(SaveTaskFailure(error: 'error')));

    final result = await usecase(taskEntity);

    expect(result, Left(SaveTaskFailure(error: 'error')));

    verify(() => repository.saveTask(taskEntity: taskEntity)).called(1);
  });
}
