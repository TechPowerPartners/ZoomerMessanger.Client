import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/service.dart';
import 'package:zoomerm_client/global/global.dart';
import 'package:zoomerm_client/homepage/chat_page.dart';
import 'package:zoomerm_client/homepage/forum_page.dart';
import 'package:zoomerm_client/homepage/search_add_dialog.dart';

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
            // ignore: prefer_const_constructors
            UserAccountsDrawerHeader(
              accountName: Text("user"), 
              accountEmail: Text("+"),
              decoration: BoxDecoration(
                image: DecorationImage(image: 
                AssetImage('assets/zmlogo.jpg'),
                fit: BoxFit.fill),
              ),
              )
            ,
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {

              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text(' New Group '),
              onTap: () {

              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts_sharp),
              title: const Text(' Contacts '),
              onTap: () {

              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text(' Saved Messages '),
              onTap: () {

              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(' Settings '),
              onTap: () {

              },
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        hoverColor: Colors.green,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        onPressed: () {
            showDialog(context: context, builder: (context) => SearchAndAddDialog());
        },
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
