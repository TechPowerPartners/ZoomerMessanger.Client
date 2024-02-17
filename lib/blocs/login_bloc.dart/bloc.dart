import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/event.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/service.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInit()) {
    on<LoginNow>(_onLoginNow);
    on<GetCurrentLogin>(_onGetCurrentLogin);
  }

  Future<void> _onLoginNow(LoginNow event, Emitter<LoginState> emit) async {
    var rs = await LoginService().logIn(event.username, event.password);
    if (rs != null) {
      emit(LoginSuccessfully(rs));
    } else {
      emit(LoginFailed());
    }
  }

  Future<void> _onGetCurrentLogin(GetCurrentLogin event, Emitter<LoginState> emit) async {
    var rs = await LoginService().getCurrentLogin();
    if (rs != null) {
      emit(LoginSuccessfully(rs));
    } else {
      emit(LoginFailed());
    }
  }
}