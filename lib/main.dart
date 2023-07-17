import 'package:flutter/material.dart';
import 'package:quotes_app/src/view/auth/signup_screen.dart';
import 'package:quotes_app/src/view/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/view/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = await pref.getString('login');

    if (val != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/homepage': (context) => const HomePage(),
      },
    );
  }
}
