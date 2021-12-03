import 'package:equatable/equatable.dart';

class GetAllTasksException extends Equatable implements Exception {
  final String message;

  const GetAllTasksException({required this.message});

  @override
  List<Object?> get props => [message];
}

class SaveTaskException extends Equatable implements Exception {
  final String message;

  const SaveTaskException({required this.message});

  @override
  List<Object?> get props => [message];
}
