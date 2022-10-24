import 'package:flutter/material.dart';
import 'package:heart_rate_monitor/pages/login.dart';
import '../theme/colors.dart';
import 'package:heart_rate_monitor/repositories/custom_icons.dart';
import '../pages/home.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
              buildSignUpButton(context),
              buildLoginBackButton(context)
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildText() => Padding(
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

Widget buildLogo() => const Icon(
      CustomIcons.heartbeat,
      color: color4,
      size: 150,
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

Widget buildSignUpButton(BuildContext context) => Padding(
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
          'Zarejestruj',
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Segoe UI',
              fontWeight: FontWeight.w700),
        ),
      ),
    );

Widget buildLoginBackButton(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
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
