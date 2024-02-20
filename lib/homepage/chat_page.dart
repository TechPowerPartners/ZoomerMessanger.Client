import 'package:flutter/material.dart';
import 'package:zoomerm_client/homepage/service.dart';
import 'package:zoomerm_client/models/chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late Future<ChatModel?> chats;

  @override
  void initState() {
    chats = HomePageService().getAllChat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ChatModel?>(
  future: chats,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (snapshot.hasError) {
      return Center(
        child: Text(snapshot.error.toString()),
      );
    } else {
      // Assuming snapshot.data is a List of chat items
      var chatList = snapshot.data;
      print(chatList);
      return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(index.toString()),
          );
        },
        separatorBuilder: (context, int) => Divider(),
        itemCount: 3, // Use the length of the chat list
      );
    }
  },
);
  }
}
