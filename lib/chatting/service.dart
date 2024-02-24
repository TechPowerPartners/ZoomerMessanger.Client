import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomerm_client/blocs/bloc_service.dart';
import 'package:zoomerm_client/global/global.dart';
import 'package:zoomerm_client/helpers/http_helper.dart';
import 'package:zoomerm_client/models/chatting_model.dart';

class ChattingService extends BlocService<ChattingModel> {
  @override
  Future<ChattingModel> get(int id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<ChattingModel>> getAll({int from = 0, int? limit}) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  Future<List<Items>> getChat(String uuid) async {
    List<Items> charRes = [];
    var rs = await HttpHelper.get("${DOMAIN}api/chats/p2p/${uuid}/messages?pageSize=1000", bearerToken: currentLogin?.token);
    print(await HttpHelper.get("api/chats/p2p/${uuid}/messages", bearerToken: currentLogin?.token));
    if (rs.statusCode == 200) {
      print("For chatting request 202");
      print(rs.body);
      final jsonResponse = jsonDecode(rs.body);
      final List<dynamic> chatList = jsonResponse['items'];
      
      for (var chattik in chatList) {
        charRes.add(Items.fromJson(chattik));
      }
      return charRes;
    }
    return charRes;
  }
  
}
/*
var rs = await HttpHelper.get(DOMAIN + getAll, bearerToken: currentLogin?.token);
    print("currentTOken is ${currentLogin?.token}");
    if (rs.statusCode == 200) {
      final jsonResponse = jsonDecode(rs.body);
      final List<dynamic> dataList = jsonResponse['data'];
      List<ChatModel> chatList = [];
      for (var data in dataList) {
        chatList.add(ChatModel.fromJson(data));
      }
      print(rs.body);
      return chatList;
    }
    
    return null;
*/