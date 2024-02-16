import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

//const DOMAIN = 'http://localhost:5135'; For developing
const DOMAIN = 'http://localhost:5135/';
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
    return await http.post(Uri.parse(url), body: jsonEncode(body));
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
    
    return await http.get(Uri.parse(url),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $bearerToken'});
  }

  
}