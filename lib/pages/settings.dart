import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/styles.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
        elevation: 0.0,
        toolbarHeight: 50,
        backgroundColor: color4,
        centerTitle: true,
        title: const Text(
          'Ustawienia',
          style: TextStyle(
              fontSize: 24, fontFamily: 'Montserrat-Medium', color: color1),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: const Text("Info"),
                          content: const Text("Built by © Keriw 2022"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, "Cancel"),
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(color4),
                                overlayColor: MaterialStateProperty.all(color2),
                              ),
                              child: const Text("Cancel"),
                            )
                          ],
                        ));
              },
              style: buttonElevatedStyle(),
              child: const Text(
                "Info",
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                FirebaseAuth.instance.signOut();
              },
              style: buttonElevatedStyle(),
              child: const Text(
                "Wyloguj",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
