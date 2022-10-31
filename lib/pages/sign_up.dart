import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:heart_rate_monitor/repositories/custom_icons.dart';
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
    const OutlineInputBorder borderInput = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: color3, width: 1));

    final buildText = Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
      child: Column(
        children: const [
          Text(
            'Zacznijmy!',
            style: TextStyle(
              color: color4,
              fontSize: 26,
              fontFamily: 'Segoe UI',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Utwórz konto, aby śledzić swoje ciśnienie. Wprowadzaj dane i analizuj je.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color4,
              fontSize: 16,
            ),
          )
        ],
      ),
    );

    const buildLogo = Icon(
      CustomIcons.heartbeat,
      color: color4,
      size: 150,
    );

    final buildUsernameField = Padding(
      padding: const EdgeInsets.fromLTRB(55, 40, 55, 5),
      child: TextFormField(
        controller: _email,
        validator: (value) {
          if (value != null) {
            if (value.contains('@')) {
              return null;
            }
            return 'Wprowadź poprawny adres e-mail';
          }
          return null;
        },
        autocorrect: true,
        keyboardType: TextInputType.emailAddress,
        enableSuggestions: false,
        cursorColor: color2,
        style: const TextStyle(
            color: color3, fontFamily: 'OpenSans', fontSize: 14),
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          errorBorder: borderInput,
          focusedErrorBorder: borderInput,
          focusedBorder: borderInput,
          enabledBorder: borderInput,
          prefixIcon: Icon(
            CustomIcons.user,
            color: color3,
            size: 16,
          ),
          labelText: 'Wpisz swój e-mail',
          labelStyle: TextStyle(color: color3),
          floatingLabelStyle: TextStyle(color: color3),
        ),
      ),
    );

    final buildPasswordField = Padding(
      padding: const EdgeInsets.fromLTRB(55, 20, 55, 20),
      child: TextFormField(
        controller: _password,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Hasło jest wymagane';
          }
          if (value.trim().length < 8) {
            return 'Hasło musi mieć co najmniej 8 znaków';
          }
          // Return null if the entered password is valid
          return null;
        },
        cursorColor: color2,
        style: const TextStyle(
            color: color3, fontFamily: 'OpenSans', fontSize: 14),
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          errorBorder: borderInput,
          focusedErrorBorder: borderInput,
          focusedBorder: borderInput,
          enabledBorder: borderInput,
          prefixIcon: Icon(
            Icons.lock,
            color: color3,
            size: 16,
          ),
          labelText: 'Wpisz swoje hasło',
          labelStyle: TextStyle(color: color3),
          floatingLabelStyle: TextStyle(color: color3),
        ),
        obscureText: true,
      ),
    );

    final buildConfirmPasswordField = Padding(
      padding: const EdgeInsets.fromLTRB(55, 10, 55, 20),
      child: TextFormField(
        controller: _passwordConfirmed,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Hasło jest wymagane';
          }
          if (value.trim().length < 8) {
            return 'Hasło musi mieć co najmniej 8 znaków';
          }
          if (value.trim() != _password.text.trim()) {
            return 'Hasła muszą być takie same';
          }
          // Return null if the entered password is valid
          return null;
        },
        cursorColor: color2,
        style: const TextStyle(
            color: color3, fontFamily: 'OpenSans', fontSize: 14),
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          errorBorder: borderInput,
          focusedErrorBorder: borderInput,
          focusedBorder: borderInput,
          enabledBorder: borderInput,
          prefixIcon: Icon(
            Icons.lock,
            color: color3,
            size: 16,
          ),
          labelText: 'Wpisz ponownie hasło',
          labelStyle: TextStyle(color: color3),
          floatingLabelStyle: TextStyle(color: color3),
        ),
        obscureText: true,
      ),
    );

    final buildSignUpButton = Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: signUp,
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.fromLTRB(75, 10, 75, 10)),
            backgroundColor: MaterialStateProperty.all(color4),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))))),
        child: const Text(
          'Zarejestruj',
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Segoe UI',
              fontWeight: FontWeight.w700),
        ),
      ),
    );

    final buildLoginBackButton = Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextButton(
          onPressed: widget.showLoginPage,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            backgroundColor: MaterialStateProperty.all(color1),
          ),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(color: color3, fontSize: 12),
              children: <TextSpan>[
                TextSpan(
                  text: 'Posiadasz już konto? ',
                ),
                TextSpan(
                  text: 'Zaloguj się tutaj',
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
          )),
    );

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
                    buildUsernameField,
                    buildPasswordField,
                    buildConfirmPasswordField,
                    buildSignUpButton,
                    buildLoginBackButton
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
