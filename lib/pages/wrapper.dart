import 'package:provider/provider.dart';
import '../pages/home.dart';
import 'package:flutter/material.dart';

import '../models/firebase_user.dart';
import '../services/handler.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);

    if (user == null) {
      return const Handler();
    } else {
      return const Home();
    }
  }
}
