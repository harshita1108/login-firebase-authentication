import 'package:flutter/material.dart';
import 'package:login_page/layouts/background.dart';
import 'package:login_page/layouts/mobile_layout.dart';
import 'package:login_page/layouts/web_layout.dart';
import 'package:login_page/screens/forgotPassword/forgot_pass_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        webChild: WebLayout(
          imageWidget: Image.asset(
            "assets/forgot_password.jpg",
            width: 150.0,
          ),
          dataWidget: ForgotPassForm(),
        ),
        mobileChild: MobileLayout(
          imageWidget: Image.asset(
            "assets/forgot_password.jpg",
            width: 75.0,
          ),
          dataWidget: ForgotPassForm(),
        ));
  }
}
