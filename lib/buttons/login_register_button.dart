import 'package:flutter/material.dart';
import 'package:login_page/layouts/background.dart';
import 'package:login_page/buttons/rounded_button.dart';
import 'package:login_page/screens/sign_up/sign_up_screen.dart';
import 'package:login_page/screens/sign_in/sign_in_screen.dart';

class LoginRegisterButtons extends StatelessWidget {
  const LoginRegisterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Welcome",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        RoundedButton(
            label: "SIGN IN",
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                  (route) => false);
            }),
        const SizedBox(
          height: 10.0,
        ),
        RoundedButton(
            label: "SIGN UP",
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                  (route) => false);
            }),
      ],
    );
  }
}
