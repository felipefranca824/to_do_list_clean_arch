import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_list_clean/src/app/cores/exceptions/exceptions.dart';
import 'package:to_do_list_clean/src/app/cores/failures/failures.dart';
import 'package:to_do_list_clean/src/app/modules/home/data/datasource/task_datasource.dart';
import 'package:to_do_list_clean/src/app/modules/home/data/models/task_model.dart';
import 'package:to_do_list_clean/src/app/modules/home/data/repositories/task/task_repository_implementation.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/repositories/task_repository.dart';

class MockTaskDatasource extends Mock implements ITaskDatasource {}

void main() {
  late ITaskRepository repository;
  late ITaskDatasource datasource;
  late TaskModel taskModel;

  setUp(() {
    taskModel = TaskModel(title: 'title', date: DateTime.now());
    datasource = MockTaskDatasource();
    repository = TaskRepositoryImplementation(datasource);
  });

  test('should return a List<TaskModel> if success', () async {
    final List<TaskModel> list = [];

    when(() => datasource.getAllTasks()).thenAnswer((_) async => list);

    final result = await repository.getAllTasks();

    expect(result, Right(list));

    verify(() => datasource.getAllTasks()).called(1);
  });

  test('should return a ServerFailure if don\'t success', () async {
    when(() => datasource.getAllTasks())
        .thenThrow(const GetAllTasksException(message: 'message'));

    final result = await repository.getAllTasks();

    expect(result, Left(ServerFailure()));

    verify(() => datasource.getAllTasks()).called(1);
  });

  test('should return true if success when call save', () async {
    when(() => datasource.saveTask(taskEntity: taskModel))
        .thenAnswer((_) async => true);

    final result = await repository.saveTask(taskEntity: taskModel);

    expect(result, const Right(true));

    verify(() => datasource.saveTask(taskEntity: taskModel)).called(1);
  });

  test('should return SaveTaskFailure if don\'t success when call save',
      () async {
    when(() => datasource.saveTask(taskEntity: taskModel))
        .thenThrow(const SaveTaskException(message: 'error'));

    final result = await repository.saveTask(taskEntity: taskModel);

    expect(result, Left(SaveTaskFailure(error: 'error')));

    verify(() => datasource.saveTask(taskEntity: taskModel)).called(1);
  });
}
