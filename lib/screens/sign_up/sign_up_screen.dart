import 'package:flutter/material.dart';
import 'package:login_page/layouts/background.dart';
import 'package:login_page/layouts/mobile_layout.dart';
import 'package:login_page/layouts/web_layout.dart';
import 'package:login_page/screens/sign_up/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      webChild: WebLayout(
        imageWidget: Image.asset(
          "assets/sign_up.jpg",
          width: 150.0,
        ),
        dataWidget: SignUpForm(),
      ),
      mobileChild: MobileLayout(
        imageWidget: Image.asset(
          "assets/sign_up.jpg",
          width: 75.0,
        ),
        dataWidget: SignUpForm(),
      ),
    );
  }
}
