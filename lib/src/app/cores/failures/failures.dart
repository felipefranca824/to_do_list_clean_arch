import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class SaveTaskFailure extends Failure {
  final String error;

  SaveTaskFailure({required this.error});

  @override
  List<Object?> get props => [
        error,
      ];
}

class DeleteTaskFailure extends Failure {
  final String error;
  DeleteTaskFailure({required this.error});
  @override
  List<Object?> get props => [error];
}

class UpdateTaskFailure extends Failure {
  final String error;

  UpdateTaskFailure({required this.error});
  @override
  List<Object?> get props => [error];
}
