import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zoomerm_client/chatting/service.dart';
import 'package:zoomerm_client/global/global.dart';
import 'package:zoomerm_client/models/chatting_model.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({super.key});

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  List<Items> chattingPage = [];

  @override
  void initState() {
    super.initState();
  }

  Future populateChatting() async {
    chattingPage = await ChattingService().getChat("3a7d1341-993e-4981-93a2-03f912c06c97"); 
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
                        "Random Person Name",
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
                          itemCount: chattingPage.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 10, bottom: 70),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(
                                  left: 14, right: 14, top: 10, bottom: 10),
                              child: Align(
                                alignment:
                                    (chattingPage[index].sender?.userName != "ismail"
                                        ? Alignment.topLeft
                                        : Alignment.topRight),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        (chattingPage[index].sender?.userName != "ismail"
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
                      onPressed: () {},
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
