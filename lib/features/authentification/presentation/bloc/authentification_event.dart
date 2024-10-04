import 'package:equatable/equatable.dart';

abstract class AuthentificationEvent extends Equatable {
  const AuthentificationEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthentificationEvent {
  final String username;
  final String password;

  const LoginRequested(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

class RegisterRequested extends AuthentificationEvent {
  final String username;
  final String password;

  const RegisterRequested(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}
