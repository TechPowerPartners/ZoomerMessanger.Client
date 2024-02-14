import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Page"),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
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
          ],
        ),
      ),
    );
  }
}
