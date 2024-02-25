import 'package:flutter/material.dart';

class SearchAndAddDialog extends StatefulWidget {
  const SearchAndAddDialog({super.key});

  @override
  State<SearchAndAddDialog> createState() => _SearchAndAddDialogState();
}

class _SearchAndAddDialogState extends State<SearchAndAddDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Search user"),
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold,
      color: Colors.black, fontSize: 20),
      actions: [
        Row(
          children: [
            TextFormField(
              
            ),
            ElevatedButton.icon
            (onPressed: () {}, 
            icon: Icon(Icons.search), 
            label: Text("Search user")),

          ],
        )
      ],
    );
  }
}