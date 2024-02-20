import 'package:flutter/material.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/service.dart';
import 'package:zoomerm_client/global/functions_g.dart';
import 'package:go_router/go_router.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  bool _isChecked = false;
  final TextEditingController _mobile_login_controller =
      TextEditingController();
  final TextEditingController _mobile_password_controller =
      TextEditingController();
  //Controllers for Login and initState
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _mobile_login_controller.dispose();
    _mobile_password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Container(
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/zmlogo.jpg',
                      fit: BoxFit.cover,
                      height: 100, // adjust the height as needed
                    ),
                    const SizedBox(
                        height: 20), // Add space between image and text fields
                    Text('Hi'),
                    const SizedBox(height: 8),
                    Text('Login'),
                    const SizedBox(height: 35),
                    TextFormField(
                      controller: _mobile_login_controller,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _mobile_password_controller,
                    ),
                    const SizedBox(height: 25),
                    Row(),
                    const SizedBox(height: 30),
                    TextButton(
                        onPressed: () async {
                          var account = await LoginService().logIn(
                              _mobile_login_controller.text,
                              _mobile_password_controller.text,
                              );
                          if (account != null) {
                            refreshLogin(context);
                            context.go('/home');
                          } else {
                            //TODO add Dialog here
                          }
                        },
                        child: Text("Login")),
                    const SizedBox(height: 15),
                    TextButton(
                        onPressed: () async {
                          var account = await LoginService().registrationTemp(
                              _mobile_login_controller.text,
                              _mobile_password_controller.text);
                          if (account == true) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Successfully Registered")));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text("Wrong")));
                          }
                        },
                        child: Text("Registration")),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
