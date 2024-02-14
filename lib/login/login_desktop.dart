import 'package:flutter/material.dart';
import 'package:zoomerm_client/homepage/homepage_state.dart';

class LoginDesktop extends StatefulWidget {
  const LoginDesktop({super.key});

  @override
  State<LoginDesktop> createState() => __LoginDesktopState();
}

class __LoginDesktopState extends State<LoginDesktop> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Image.asset(
          'assets/zmlogo.jpg',
          fit: BoxFit.cover,
          height: 1000,
        )),
        Expanded(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 21),
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Hi'),
                const SizedBox(height: 8),
                Text(
                  'Login',
                ),
                const SizedBox(height: 35),
                TextField(
                    //...
                    ),
                const SizedBox(height: 20),
                TextField(
                    //...
                    ),
                const SizedBox(height: 25),
                Row(
                    //...
                    ),
                const SizedBox(height: 30),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text("Login")),
                const SizedBox(height: 15),
                TextButton(onPressed: () {}, child: Text("Registration"))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
