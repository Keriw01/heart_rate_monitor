import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import 'login_form_elements.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback changeFlagShowLoginPage;

  const LoginPage({super.key, required this.changeFlagShowLoginPage});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Failed with error code: ${e.code}');
        print(e.message);
      }
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      buildText,
                      buildLogo,
                      buildUsernameField(_email),
                      buildPasswordField(_password),
                      buildLoginButton(signIn),
                      buildSingUpButton(widget.changeFlagShowLoginPage),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
