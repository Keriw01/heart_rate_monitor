import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../repositories/custom_icons.dart';

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

Widget buildUsernameField(TextEditingController email) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(55, 40, 55, 5),
    child: TextFormField(
      controller: email,
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
      style:
          const TextStyle(color: color3, fontFamily: 'OpenSans', fontSize: 14),
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
}

Widget buildPasswordField(TextEditingController password) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(55, 20, 55, 20),
    child: TextFormField(
      controller: password,
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
      style:
          const TextStyle(color: color3, fontFamily: 'OpenSans', fontSize: 14),
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
}

Widget buildConfirmPasswordField(
    TextEditingController password, TextEditingController passwordConfirmed) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(55, 10, 55, 20),
    child: TextFormField(
      controller: passwordConfirmed,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Hasło jest wymagane';
        }
        if (value.trim().length < 8) {
          return 'Hasło musi mieć co najmniej 8 znaków';
        }
        if (value.trim() != password.text.trim()) {
          return 'Hasła muszą być takie same';
        }
        // Return null if the entered password is valid
        return null;
      },
      cursorColor: color2,
      style:
          const TextStyle(color: color3, fontFamily: 'OpenSans', fontSize: 14),
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
}

Widget buildSignUpButton(signUp) {
  return Padding(
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
            fontSize: 20, fontFamily: 'Segoe UI', fontWeight: FontWeight.w700),
      ),
    ),
  );
}

Widget buildLoginBackButton(widget) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: TextButton(
        onPressed: widget,
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
}
