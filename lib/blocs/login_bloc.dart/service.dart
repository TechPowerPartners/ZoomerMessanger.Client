
import 'dart:convert';

import 'package:zoomerm_client/blocs/bloc_service.dart';
import 'package:zoomerm_client/global/global.dart';
import 'package:zoomerm_client/helpers/login_helper.dart';
import 'package:zoomerm_client/models/login_model.dart';

import '../../helpers/http_helper.dart';

class LoginService extends BlocService<LoginModel> {
  @override
  Future<LoginModel> get(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<LoginModel>> getAll({int from = 0, int? limit}) {
    throw UnimplementedError();
  }

  Future<LoginModel?> getCurrentLogin() async {
    var rs = await LocalHelper.getAccountFromLocal();
    
    currentLogin = rs;
    return currentLogin;
  }

  Future<LoginModel?> logIn(String username, String password) async {
    Map<String, String> accountInput = {"username": username, "password": password};
    var rs = await HttpHelper.post(DOMAIN + "api/accounts/sign-in", accountInput);
   
    if (rs.statusCode == 200) {
      var jsonObject = jsonDecode(rs.body);
      var account = LoginModel.fromJson(jsonObject);
      currentLogin = account;
      LocalHelper.saveAccountToLocal(account);
      return account;
    }
    return null;
  }

  Future<LoginModel?> logInTemp(String username, String password, String link) async {
    Map<String, String> accountInput = {"username": username , "password": password};
    var rs = await HttpHelper.postTempLogin(DOMAIN + link, accountInput);
    if (rs.statusCode == 200) {
      var jsonObject = jsonDecode(rs.body);
      var account = LoginModel(jsonEncode(rs.body));
      currentLogin = account;
      LocalHelper.saveAccountToLocal(account);
      return account;
    }
    return null;
  }

  Future<bool> registrationTemp(String user, String password) async {
    Map<String, String> registrationInput = {"username": user, "password": password};
    var rs = await HttpHelper.postTempLogin(DOMAIN + "api/accounts/sign-up", registrationInput);
    return rs.statusCode == 200 ? true : false;
  }

  Future logOut() async {
    currentLogin = null;
    return await LocalHelper.deleteAccountFromLocal();
  }
}