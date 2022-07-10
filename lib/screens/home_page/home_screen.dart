import 'package:flutter/material.dart';
import 'package:login_page/layouts/background.dart';
import 'package:login_page/layouts/mobile_layout.dart';
import 'package:login_page/layouts/web_layout.dart';
import 'package:login_page/screens/home_page/welcome_screen.dart';
import 'package:login_page/buttons/rounded_button.dart';
import 'package:login_page/services/authentication_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        webChild: WebLayout(
          imageWidget: Image.asset(
            "assets/home_background.jfif",
            width: 150.0,
          ),
          dataWidget: const HomeScreenData(),
        ),
        mobileChild: MobileLayout(
          imageWidget: Image.asset(
            "assets/home_background.jfif",
            height: 300.0,
          ),
          dataWidget: const HomeScreenData(),
        ));
  }
}

class HomeScreenData extends StatelessWidget {
  const HomeScreenData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  "Hello",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  AuthenticationService().getUserName() ?? "",
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                const Text(
                  "                                                                       Thanks for your visit again",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 100.0,
              height: 20.0,
              child: RoundedButton(
                label: "Sign Out",
                onPressed: () {
                  AuthenticationService().signOut().then((value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomePage()),
                        (route) => false);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
