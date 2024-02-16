import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginNow extends LoginEvent {
  final String username;
  final String password;

  LoginNow(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

class GetCurrentLogin extends LoginEvent{}

class LogOutNow extends LoginEvent{
}