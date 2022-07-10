import 'package:flutter/material.dart';
import 'package:login_page/buttons/rounded_button.dart';
import 'package:login_page/screens/sign_in/sign_in_screen.dart';
import 'package:login_page/services/auth_response.dart';
import 'package:login_page/services/authentication_service.dart';
import 'package:login_page/utils/util.dart';

class ForgotPassForm extends StatelessWidget {
  ForgotPassForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  //final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            "Forgot Password",
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
                      contentPadding:
                          EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      fillColor: Colors.grey.shade200),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email cannot be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                RoundedButton(
                    label: "Reset Password",
                    onPressed: () {
                      AuthenticationService()
                          .resetPassword(
                        email: emailController.text,
                      )
                          .then((authResponse) {
                        if (authResponse.authStatus == AuthStatus.success) {
                          Util.showSuccessMessage(context,
                              "A email has been send to your registered id....Kindly check the mail");
                        } else {
                          Util.showErrorMessage(context, authResponse.message);
                        }
                      });
                    })
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account? ",
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                      (route) => false);
                },
                child: const Text(
                  "SIGN IN",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
