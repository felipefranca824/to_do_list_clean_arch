import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_list_clean/src/app/modules/home/data/datasource/task_datasource.dart';
import 'package:to_do_list_clean/src/app/modules/home/data/models/task_model.dart';
import 'package:to_do_list_clean/src/app/modules/home/data/repositories/task/task_repository_implementation.dart';
import 'package:to_do_list_clean/src/app/modules/home/domain/repositories/task_repository.dart';

class MockTaskDatasource extends Mock implements ITaskDatasource {}

void main() {
  late ITaskRepository repository;
  late ITaskDatasource datasource;
  late final TaskModel taskModel;

  setUp(() {
    datasource = MockTaskDatasource();
    repository = TaskRepositoryImplementation(datasource);
    taskModel = TaskModel(title: 'title', date: DateTime.now());
  });

  test('should return a List<TaskModel> if success', () async {
    final List<TaskModel> list = [];

    when(() => datasource.getAllTasks()).thenAnswer((_) async => list);

    final result = await repository.getAllTasks();

    expect(result, Right(list));

    verify(() => datasource.getAllTasks()).called(1);
  });
}
