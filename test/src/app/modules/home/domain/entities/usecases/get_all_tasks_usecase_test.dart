import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_list_clean/src/app/cores/failures/failures.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/entities/task_entity.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/repositories/task_repository.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/usecases/get_all_tasks_usecase.dart';

class MockTaskRepository extends Mock implements ITaskRepository {}

void main() {
  late IGetAllTaskUsecase usecase;
  late ITaskRepository repository;

  setUp(() {
    repository = MockTaskRepository();
    usecase = GetAllTasksUsecase(repository);
  });

  final tListTasks = [
    TaskEntity(title: 'teste', date: DateTime.now()),
    TaskEntity(title: 'teste2', date: DateTime.now())
  ];

  test('should return a List of TaskEntity if successed', () async {
    when(() => repository.getAllTasks())
        .thenAnswer((_) async => Right<Failure, List<TaskEntity>>(tListTasks));

    final result = await usecase();

    expect(result, Right(tListTasks));

    verify(() => repository.getAllTasks()).called(1);
  });

  test('should return a ServerFailure if don\'t successed', () async {
    final error = ServerFailure();

    when(() => repository.getAllTasks()).thenAnswer((_) async => Left(error));

    final result = await usecase();

    expect(result, Left(ServerFailure()));

    verify(() => repository.getAllTasks()).called(1);
  });
}
