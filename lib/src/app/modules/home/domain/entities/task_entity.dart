import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final bool isFinished;
  final DateTime date;

  TaskEntity(
      {this.id = '',
      required this.title,
      required this.date,
      this.isFinished = false});

  bool get isValidName => title.length >= 5 && title.length <= 50;

  @override
  List<Object?> get props => [
        id,
        date,
        isFinished,
        title,
      ];
}
