import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
            FirebaseAuth.instance.signOut();
          },
          child: const Text(
            "Log out",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
