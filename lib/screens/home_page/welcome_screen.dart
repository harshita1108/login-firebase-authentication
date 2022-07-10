import 'package:flutter/material.dart';
import 'package:login_page/layouts/background.dart';
import 'package:login_page/layouts/web_layout.dart';
import 'package:login_page/layouts/mobile_layout.dart';

import '../../buttons/login_register_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        webChild: WebLayout(
            imageWidget: Image.asset(
              "assets/background1.webp",
              width: 250.0,
              height: 250.0,
            ),
            dataWidget: const LoginRegisterButtons()),
        mobileChild: MobileLayout(
          imageWidget: Image.asset(
            "assets/background1.webp",
            width: 150.0,
            //height: 250.0,
          ),
          dataWidget: const LoginRegisterButtons(),
        ));
  }
}
