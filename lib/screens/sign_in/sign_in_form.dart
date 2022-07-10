import 'package:flutter/material.dart';
import 'package:login_page/buttons/rounded_button.dart';
import 'package:login_page/screens/forgotPassword/forgot_pass_screen.dart';
import 'package:login_page/screens/home_page/home_screen.dart';
import 'package:login_page/screens/sign_in/sign_in_screen.dart';
import 'package:login_page/screens/forgotPassword/forgot_pass_form.dart';
import 'package:login_page/screens/sign_up/sign_up_screen.dart';
import 'package:login_page/services/auth_response.dart';
import 'package:login_page/services/authentication_service.dart';
import 'package:login_page/utils/util.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        const Text(
          "Sign In",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    fillColor: Colors.grey.shade200),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    fillColor: Colors.grey.shade200),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()),
                          (route) => false);
                    },
                    child: const Text("Forgot Password?"),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              RoundedButton(
                  label: "Login",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AuthenticationService()
                          .signInWithEmail(
                              email: emailController.text,
                              password: passController.text)
                          .then((authResponse) {
                        if (authResponse.authStatus == AuthStatus.success) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                              (route) => false);
                        } else {
                          Util.showErrorMessage(context, authResponse.message);
                        }
                      });
                    }
                  })
            ],
          ),
        ),
        const SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Dont have an account? ",
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                    (route) => false);
              },
              child: const Text(
                "SIGN UP",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
