import 'package:heart_rate_monitor/pages/login.dart';
import 'package:heart_rate_monitor/pages/sign_up.dart';
import 'package:flutter/material.dart';

class Handler extends StatefulWidget {
  const Handler({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Handler();
  }
}

class _Handler extends State<Handler> {
  bool showSignin = true;

  void toggleView() {
    setState(() {
      showSignin = !showSignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignin) {
      return LoginPage(toggleView: toggleView);
    } else {
      return SignUp(toggleView: toggleView);
    }
  }
}
