class TaskEntity {
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
}
