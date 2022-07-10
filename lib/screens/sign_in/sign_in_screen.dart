import 'package:flutter/material.dart';
import 'package:login_page/layouts/background.dart';
import 'package:login_page/layouts/mobile_layout.dart';
import 'package:login_page/layouts/web_layout.dart';
import 'package:login_page/screens/sign_in/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        webChild: WebLayout(
          imageWidget: Image.asset("assets/sign_in.jpg", width: 150.0),
          dataWidget: LoginForm(),
        ),
        mobileChild: MobileLayout(
          imageWidget: Image.asset(
            "assets/sign_in.jpg",
            width: 75.0,
          ),
          dataWidget: LoginForm(),
        ));
  }
}
