import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heart_rate_monitor/repositories/custom_icons.dart';
import '../theme/colors.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;

  const LoginPage({super.key, required this.showRegisterPage});

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
    const OutlineInputBorder borderInput = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: color3, width: 1));

    final buildText = Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          'Heart Rate Monitor',
          style: TextStyle(
            color: color4,
            fontSize: 26,
            fontFamily: 'Segoe UI',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );

    final buildLogo = SvgPicture.asset(
      'assets/images/undraw_medicine_b-1-ol.svg',
      width: 200,
      height: 200,
    );

    final buildUsernameField = Padding(
      padding: const EdgeInsets.fromLTRB(55, 40, 55, 5),
      child: TextFormField(
        controller: _email,
        autocorrect: true,
        keyboardType: TextInputType.emailAddress,
        enableSuggestions: false,
        validator: (value) {
          if (value != null) {
            if (value.contains('@')) {
              return null;
            }
            return 'Wprowadź poprawny adres e-mail';
          }
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

    final buildLoginButton = Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: signIn,
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.fromLTRB(75, 10, 75, 10)),
            backgroundColor: MaterialStateProperty.all(color4),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))))),
        child: const Text(
          'Zaloguj',
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Segoe UI',
              fontWeight: FontWeight.w700),
        ),
      ),
    );

    final buildSingUpButton = Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextButton(
          onPressed: widget.showRegisterPage,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            backgroundColor: MaterialStateProperty.all(color1),
          ),
          child: const Text(
            'Utwórz konto',
            style:
                TextStyle(color: color3, fontFamily: 'Segoe UI', fontSize: 12),
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
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      buildText,
                      buildLogo,
                      buildUsernameField,
                      buildPasswordField,
                      buildLoginButton,
                      buildSingUpButton,
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
