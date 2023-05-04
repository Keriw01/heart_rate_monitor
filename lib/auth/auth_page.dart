import 'package:flutter/material.dart';
import 'package:heart_rate_monitor/pages/login/login.dart';
import 'package:heart_rate_monitor/pages/sign_up/sign_up.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
  void changeFlagShowLoginPage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(changeFlagShowLoginPage: changeFlagShowLoginPage);
    } else {
      return SignUp(changeFlagShowLoginPage: changeFlagShowLoginPage);
    }
  }
}
