import 'package:to_do_list_clean/src/app/modules/home/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    String id = '',
    required String title,
    required DateTime date,
    bool isFinished = false,
  }) : super(date: date, title: title, isFinished: isFinished, id: id);

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
        title: map['title'],
        date: DateTime.fromMillisecondsSinceEpoch(map['date']),
        id: map['id'],
        isFinished: map['isFinished'] == 0 ? false : true);
  }

  toMap() {
    return {
      'title': title,
      'date': date.millisecondsSinceEpoch,
      'isFinished': isFinished,
    };
  }
}
