import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/event.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/service.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/state.dart';

class LoginBloc extends Bloc<LoginBloc, LoginState> {
  LoginBloc() : super(LoginInit());

  
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginNow) {
      yield* mapLoginNowToState(event);
    } else if (event is GetCurrentLogin) {
      yield* mapGetCurrentLoginToState(event);
    }
  }

  Stream<LoginState> mapLoginNowToState(LoginNow event) async* {
    var rs = await LoginService().logIn(event.username, event.password);
    if (rs != null) {
      yield LoginSuccessfully(rs);
    } else {
      yield LoginFailed();
    }
  }

  Stream<LoginState> mapGetCurrentLoginToState(GetCurrentLogin event) async* {
    var rs = await LoginService().getCurrentLogin();
    if (rs != null) {
      yield LoginSuccessfully(rs);
    } else {
      yield LoginFailed();
    }
  }
}
