import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../pages/sign_up_form_elements.dart';
import '../theme/colors.dart';

class SignUp extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUp({super.key, required this.showLoginPage});

  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _passwordConfirmed = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CollectionReference users =
      FirebaseFirestore.instance.collection('results_of_pressure');
  Future<void> addUser() {
    return users.doc(_email.text.trim()).set({'e-mail': _email.text.trim()});
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.text.trim(), password: _password.text.trim());
        addUser();
      } on FirebaseAuthException catch (e) {
        if (kDebugMode) {
          print('Failed with error code: ${e.code}');
          print(e.message);
        }
      }
    }
  }

  bool passwordConfirmed() {
    if (_password.text.trim() == _passwordConfirmed.text.trim()) {
      return true;
    } else {
      return false;
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
                autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    buildText,
                    buildLogo,
                    buildUsernameField(_email),
                    buildPasswordField(_password),
                    buildConfirmPasswordField(_password, _passwordConfirmed),
                    buildSignUpButton(signUp),
                    buildLoginBackButton(widget.showLoginPage)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
