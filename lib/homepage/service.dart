

import 'dart:convert';

import 'package:zoomerm_client/blocs/bloc_service.dart';
import 'package:zoomerm_client/global/global.dart';
import 'package:zoomerm_client/helpers/http_helper.dart';
import 'package:zoomerm_client/models/chat_model.dart';

import '../helpers/login_helper.dart';

class HomePageService extends BlocService<ChatModel> {
  @override
  Future<ChatModel> get(int id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<ChatModel>> getAll({int from = 0, int? limit}) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  Future<ChatModel?> getAllChat({String getAll = "api/chats"}) async {
    
    var rs = await HttpHelper.get(DOMAIN + getAll, bearerToken: currentLogin?.token);
    print("currentTOken is ${currentLogin?.token}");
    if (rs.statusCode == 200) {
      var jsonObject = jsonDecode(rs.body);
      print(rs.body);
      
      var chatInfo = ChatModel(jsonEncode(rs.body));
      print(rs.body);
      return chatInfo;
    }
    
    return null;
  }
  
}