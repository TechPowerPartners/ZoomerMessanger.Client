import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoomerm_client/global/global.dart';
import 'package:zoomerm_client/helpers/login_helper.dart';
import 'package:zoomerm_client/models/login_model.dart';

//const DOMAIN = 'http://localhost:5135'; For developing
const DOMAIN = 'https://localhost:7065/';
const HUB_ENDPOINT = 'https://localhost:7065/hubs/chats/p2p';
const LOGIN_ENDPOINT = DOMAIN + 'login';
class HttpHelper {
  static Future<http.Response> post(String url, Map<String, dynamic> body,
      {String? bearerToken}) async {
    return (await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
    }));
  }
  
  static Future<http.Response> postTempLogin(String url, Map<String, dynamic> body) async {
    return await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
      HttpHeaders.contentTypeHeader: 'application/json'
    });
  }
  static Future<http.Response> put(String url, Map<String, dynamic> body,
      {String? bearerToken}) async {
    return (await http.put(Uri.parse(url), body: jsonEncode(body), headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
    }));
  }

  static Future<http.Response> get(String url, {String? bearerToken}) async {
    print("Sending request TO ${url}");
    return await http.get(Uri.parse(url),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $bearerToken'});
  }

  
}