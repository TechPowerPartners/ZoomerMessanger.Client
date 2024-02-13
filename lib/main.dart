import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('ru', ''),
        Locale('kr', ''),
      ],
      home: TempWidget(),
    );
  }
}

class TempWidget extends StatefulWidget {
  const TempWidget({super.key});

  @override
  State<TempWidget> createState() => _TempWidgetState();
}

class _TempWidgetState extends State<TempWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("1"),
                Text("2"),
                Text("3"),
              ],
            ),
            Row(
              children: <Widget>[
                Text("1"),
                Text("2"),
                Text("3"),
              ],
            ),
            Row(
              children: <Widget>[
                Text("1"),
                Text("2"),
                Text("3"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
