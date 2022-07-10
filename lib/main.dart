import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/screens/home_page/welcome_screen.dart';
import 'package:login_page/services/authentication_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AuthenticationService.intializeService();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomePage(),
    );
  }
}
