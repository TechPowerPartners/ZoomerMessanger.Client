

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoomerm_client/models/login_model.dart';

class LocalHelper {
  static saveAccountToLocal(LoginModel accountModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var rs = await pref.setString('login', jsonEncode(accountModel));
  }

  static deleteAccountFromLocal() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var rs = await pref.remove('login');
  }

  static Future<LoginModel?> getAccountFromLocal() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var account = pref.getString('login');
    if (account != null) {
      return LoginModel.fromJson(jsonDecode(account));
    }
  }
}