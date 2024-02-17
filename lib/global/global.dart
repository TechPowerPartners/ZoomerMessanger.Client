import 'package:zoomerm_client/helpers/login_helper.dart';
import 'package:zoomerm_client/models/login_model.dart';

getGlobal() async {
  var login = await LocalHelper.getAccountFromLocal();
  currentLogin = login;
}
LoginModel? currentLogin;