import 'package:equatable/equatable.dart';

class GetAllTasksException extends Equatable implements Exception {
  final String message;

  GetAllTasksException(this.message);

  @override
  List<Object?> get props => [message];
}
