import 'package:flutter/material.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Hi'),
                  const SizedBox(height: 8),
                  Text('Login'),
                  const SizedBox(height: 35),
                  TextFormField(),
                  const SizedBox(height: 20),
                  TextFormField(),
                  const SizedBox(height: 25),
                  Row(),
                  const SizedBox(height: 30),
                  TextButton(onPressed: () {}, child: Text("Login")),
                  const SizedBox(height: 15),
                  TextButton(onPressed: () {}, child: Text("Registration")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
