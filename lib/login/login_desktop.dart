import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/service.dart';
import 'package:zoomerm_client/global/functions_g.dart';
import 'package:zoomerm_client/homepage/homepage_state.dart';

class LoginDesktop extends StatefulWidget {
  const LoginDesktop({super.key});

  @override
  State<LoginDesktop> createState() => __LoginDesktopState();
}

class __LoginDesktopState extends State<LoginDesktop> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _mobile_login_controller = TextEditingController();
    final TextEditingController _mobile_password_controller = TextEditingController();
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
                const Text('Login',),
                const SizedBox(height: 35),
                TextField(
                    controller: _mobile_login_controller,
                    ),
                const SizedBox(height: 20),
                TextField(
                    controller: _mobile_password_controller,
                    ),
                const SizedBox(height: 25),
                Row(
                    //...
                    ),
                const SizedBox(height: 30),
                TextButton(
                    onPressed: () async {
                      var account = await LoginService()
                      .logInTemp(_mobile_login_controller.text, _mobile_password_controller.text, 'api/accounts/sign-in');
                      if(account != null) {
                        print(context);
                        print("success");
                        refreshLogin(context);
                        context.go('/home');
                      }
                      else {
                        print("something went wrong");
                      }
                    },
                    child: const Text("Login")),
                const SizedBox(height: 15),
                TextButton(onPressed: () async {
                    var account =  await LoginService()
                    .registrationTemp(_mobile_login_controller.text, _mobile_password_controller.text);
                if(account == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: 
                  Text("Successfully Registered")));
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: 
                  Text("Wrong")));
                }

                }, child: const Text("Registration"))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
