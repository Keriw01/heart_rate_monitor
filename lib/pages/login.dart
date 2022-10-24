import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heart_rate_monitor/repositories/custom_icons.dart';
import 'package:heart_rate_monitor/theme/colors.dart';
import '../pages/sign_up.dart';
import '../pages/home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              buildText(),
              buildLogo(),
              buildUsernameField(),
              buildPasswordField(),
              buildLoginButton(context),
              buildSingUpButton(context)
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildText() => Padding(
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

Widget buildLogo() => SvgPicture.asset(
      'assets/images/undraw_medicine_b-1-ol.svg',
      width: 200,
      height: 200,
    );

Widget buildUsernameField() => Padding(
      padding: const EdgeInsets.fromLTRB(55, 40, 55, 5),
      child: TextFormField(
        autocorrect: true,
        textCapitalization: TextCapitalization.words,
        enableSuggestions: false,
        validator: (value) {
          return null;
        },
        cursorColor: color2,
        style: const TextStyle(
            color: color3, fontFamily: 'OpenSans', fontSize: 14),
        // ignore: prefer_const_constructors
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: color3, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: color3, width: 1)),
          prefixIcon: Icon(
            CustomIcons.user,
            color: color3,
            size: 16,
          ),
          labelText: 'Wpisz swój e-mail',
          labelStyle: TextStyle(color: color3),
          floatingLabelStyle: TextStyle(color: color3),
        ),
        onSaved: (username) {},
      ),
    );

Widget buildPasswordField() => Padding(
      padding: const EdgeInsets.fromLTRB(55, 20, 55, 20),
      child: TextFormField(
        validator: (value) {
          return null;
        },
        cursorColor: color2,
        style: const TextStyle(
            color: color3, fontFamily: 'OpenSans', fontSize: 14),
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: color3, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: color3, width: 1)),
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
        onSaved: (password) {},
      ),
    );

Widget buildLoginButton(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home()));
        },
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

Widget buildSingUpButton(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUp()));
          },
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
