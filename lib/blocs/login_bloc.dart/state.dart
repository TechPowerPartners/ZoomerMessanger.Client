import 'package:equatable/equatable.dart';
import 'package:zoomerm_client/models/LoginModel.dart';

class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}
class LoginSuccessfully extends LoginState{
  final LoginModel accountModel;

  LoginSuccessfully(this.accountModel);
  @override
  List<Object> get props => [accountModel];
}

class LoginFailed extends LoginState{}
class LoginLoading extends LoginState{}
class LoginInit extends LoginState{}