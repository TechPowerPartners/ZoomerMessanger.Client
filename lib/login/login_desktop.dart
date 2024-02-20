import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/service.dart';
import 'package:zoomerm_client/global/functions_g.dart';
import 'package:zoomerm_client/homepage/home_page.dart';

class LoginDesktop extends StatefulWidget {
  const LoginDesktop({super.key});

  @override
  State<LoginDesktop> createState() => __LoginDesktopState();
}

class __LoginDesktopState extends State<LoginDesktop> {
  final TextEditingController _login_desktop_controller =
      TextEditingController();
  final TextEditingController _password_desktop_controller =
      TextEditingController();
  //Controllers for Login and initState
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _login_desktop_controller.dispose();
    _password_desktop_controller.dispose();
    super.dispose();
  }

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
                const SizedBox(height: 8),
                const Text(
                  'Login',
                ),
                const SizedBox(height: 35),
                TextField(
                  controller: _login_desktop_controller,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _password_desktop_controller,
                ),
                const SizedBox(height: 25),
                Row(
                    //...
                    ),
                const SizedBox(height: 30),
                TextButton(
                    onPressed: () async {
                     
                      var account = await LoginService().logIn(
                          _login_desktop_controller.text,
                          _password_desktop_controller.text,
                          );
                      if (account != null) {
                        // ignore: use_build_context_synchronously
                        refreshLogin(context);
                        // ignore: use_build_context_synchronously
                        context.go('/home');
                        Navigator.pop(context);
                      } else {
                        //TODO ADD DIALOG
                      }
                    },
                    child: const Text("Login")),
                const SizedBox(height: 15),
                TextButton(
                    onPressed: () async {
                      var account = await LoginService().registrationTemp(
                          _login_desktop_controller.text,
                          _password_desktop_controller.text);
                      if (account == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Successfully Registered")));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Wrong")));
                      }
                    },
                    child: const Text("Registration"))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
