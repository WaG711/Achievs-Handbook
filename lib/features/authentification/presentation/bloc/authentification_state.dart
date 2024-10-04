import 'package:equatable/equatable.dart';

abstract class AuthentificationState extends Equatable {
  const AuthentificationState();

  @override
  List<Object> get props => [];
}

class Initial extends AuthentificationState {}

class Loading extends AuthentificationState {}

class Authenticated extends AuthentificationState {
  final String userId;

  const Authenticated(this.userId);

  @override
  List<Object> get props => [userId];
}

class Error extends AuthentificationState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
