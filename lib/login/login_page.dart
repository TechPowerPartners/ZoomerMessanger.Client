import 'package:flutter/material.dart';
import 'package:zoomerm_client/login/login_desktop.dart';
import 'package:zoomerm_client/login/login_mobile.dart';

class LoginEnter extends StatelessWidget {
  const LoginEnter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constrainst) {
        if (constrainst.maxWidth < 600) {
          return const LoginMobile();
        } else if (constrainst.maxWidth > 600 && constrainst.maxWidth < 900) {
          return const LoginMobile();
        } else {
          return const LoginDesktop();
        }
      }),
    );
  }
}
