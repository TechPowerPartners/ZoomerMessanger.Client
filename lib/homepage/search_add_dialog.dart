import 'package:flutter/material.dart';

class SearchAndAddDialog extends StatefulWidget {
  const SearchAndAddDialog({super.key});

  @override
  State<SearchAndAddDialog> createState() => _SearchAndAddDialogState();
}

class _SearchAndAddDialogState extends State<SearchAndAddDialog> {
  final List<String> names = ['ismail', 'Bob', 'Charlie', 'Diana'];
  List<String> results = [];
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Search user"),
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold,
      color: Colors.black, fontSize: 20),
      actions: [
        Row(
          children: [
            SizedBox(
              width: 200,
              child: TextFormField(
                controller: searchController,
              decoration: InputDecoration(
                labelText: "put the name or id",
                border: OutlineInputBorder()
              ),
            ),
            ),
            IconButton(onPressed: (){
              for(var temps in names) {
                print(searchController.text);
                if(temps == searchController.text){
                  print("Added someone");
                  setState(() {
                    debugPrint("Added someone");
                    results.add(temps);
                  });
                }
              }
            }, 
            icon: Icon(Icons.search))
            
          ],
        )
      ],
      content: Card(
        child: Text(results.isEmpty ? "No results" : results[0]),
      )
    );
  }
}