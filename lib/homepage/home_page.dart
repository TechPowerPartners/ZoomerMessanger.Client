import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/service.dart';
import 'package:zoomerm_client/homepage/chat_page.dart';
import 'package:zoomerm_client/homepage/forum_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Page"),
        ),
      ),
      body: currentPageIndex == 0 ? ChatPage() : ForumPage(),
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            DrawerHeader(child: Icon(Icons.picture_in_picture_rounded)),
            ListTile(
              title: Text("Temp"),
            ),
            ListTile(
              title: Text("Temp"),
            ),
            ListTile(
              title: Text("Temp"),
            ),
            ListTile(
              title: Text("Temp"),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton.icon(onPressed: () {
                  var logout = LoginService().logOut();
                  context.go('/');
                }, icon: Icon(Icons.exit_to_app,),
                 label: Text("exit application")),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        ///Change dynamically colors of buttons 
        indicatorColor: Colors.red,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.chat, color: Colors.white,),
           label: 'Chat'),
          NavigationDestination(icon: Icon(Icons.forum, color: Colors.white,),
           label: 'Forum')
        ],
      ),
      
    );
  }
}
