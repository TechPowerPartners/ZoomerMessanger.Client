import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zoomerm_client/homepage/service.dart';
import 'package:zoomerm_client/models/chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [];
  
  @override
  void initState() {
    // chats = HomePageService().getAllChat();
    
    super.initState();
  }

  Future getAllChats() async {
    List<ChatModel>? tempChats = await HomePageService().getAllChat();
    if(tempChats == null) {
      return 0;
    }
    else {
    for(var tempChat in tempChats!){
      chats.add(tempChat);
    }
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllChats(), 
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.none && chats.hashCode == null){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.separated
        (itemBuilder: ((context, index) {
          return ListTile(
          
            onTap: () {
              context.goNamed('mychats', 
              pathParameters: 
              {'chatid': chats[index].id.toString(), 'interl': chats[index].interlocutor!.userName.toString()
              });
            },
            title: Text(chats[index].interlocutor!.userName.toString()),
            subtitle: Text('TYT SOOBSHENIYA BUDUT...'),
            leading: Container(
              height: 50,
              width: 50,
              color: Colors.black
            ),
            trailing: Icon(Icons.menu),
          );
        }),
         
        separatorBuilder: (context, index) {
          return const Divider();
        }, 
        itemCount: chats.length
        );


      });
  }
}
