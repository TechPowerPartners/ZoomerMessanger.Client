import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/ihub_protocol.dart';
import 'package:signalr_netcore/itransport.dart';
import 'package:zoomerm_client/chatting/receiver.dart';
import 'package:zoomerm_client/chatting/service.dart';
import 'package:zoomerm_client/global/global.dart';
import 'package:zoomerm_client/helpers/http_helper.dart';
import 'package:zoomerm_client/models/chatting_model.dart';

class ChattingPage extends StatefulWidget {
  final chatid;
  final interlocutor;
  ChattingPage({super.key, required this.chatid, required this.interlocutor});

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  ScrollController _scrollController = ScrollController();
  List<Items> chattingPage = [];
  final TextEditingController _messageController = TextEditingController();
  HubConnection? hubConnection;
  

  @override
  void initState() {
    super.initState();
    _initConnection();
  }



  @override
  void dispose() {
    hubConnection?.stop();
    _messageController.dispose();
    super.dispose();
  }

  Future populateChatting() async {
    List<Items> tempItems = await ChattingService().getChat(widget.chatid);
    chattingPage =
        tempItems.reversed.toList();
  }

  void _initConnection() async {
  MessageHeaders headers = MessageHeaders();
  
  hubConnection = HubConnectionBuilder()
      .withUrl('${HUB_ENDPOINT}?token=${currentLogin?.token}')
      .withAutomaticReconnect(retryDelays: [2000, 5000, 10000]).build();

  try {
    await hubConnection?.start();
    hubConnection?.on('newChatMessage', (messageData) {
      if (messageData is List<Object?>) {
        for (var element in messageData) {
            String messageMap = jsonEncode(element);
            Items tempItems = new Items(sender: new Sender(userName: widget.interlocutor), content: messageMap);
            setState(() {
              chattingPage.add(tempItems);
              _scrollController.jumpTo(_scrollController.position.minScrollExtent);
            });
        }
      } else {
        debugPrint("Invalid message data format: $messageData");
      }
    });
  } catch (e) {
    debugPrint('Connection error: $e');
  }
}

  void sendMessage(String message) async {
    if (hubConnection?.state == HubConnectionState.Connected) {
      debugPrint("Sent message");
      await hubConnection!.invoke('Send',
          args: [widget.chatid, message]);
      setState(() {
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
      });
    } else {
      debugPrint('Not connected to SignalR');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
              child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    context.go('/home');
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://picsum.photos/id/237/200/300"),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.interlocutor,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text("Online"),
                    ],
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black87,
                )
              ],
            ),
          )),
        ),
        body: Stack(
          children: <Widget>[
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.none ||
                    chattingPage.length == 0) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: chattingPage.length,
                  shrinkWrap: true,
                  reverse: true,
                  padding: EdgeInsets.only(top: 10, bottom: 70),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment:
                            (chattingPage[index].sender?.userName == widget.interlocutor
                                ? Alignment.topLeft
                                : Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (chattingPage[index].sender?.userName == widget.interlocutor
                                ? Colors.grey.shade200
                                : Colors.blue[200]),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            chattingPage[index].content.toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              future: populateChatting(),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 80,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        sendMessage(_messageController.text);
                        setState(() {
                          Items tempSenderItems = new Items(
                          content: _messageController.text,
                          sender: Sender(userName: widget.interlocutor));

                          chattingPage.add(tempSenderItems);
                          _messageController.clear();
                        });
                        
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: Colors.black54,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
