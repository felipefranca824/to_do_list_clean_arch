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
