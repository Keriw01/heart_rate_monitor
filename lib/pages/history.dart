import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/pressure_list_item.dart';

import '../model/pressure.dart';
import '../theme/colors.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

Stream<List<Pressure>> readPressure() {
  var user = FirebaseAuth.instance.currentUser;
  return FirebaseFirestore.instance
      .collection('results_of_pressure')
      .doc(user?.email)
      .collection('results_pressure')
      .orderBy('addDate', descending: true)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Pressure.fromJson(doc.data())).toList());
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      StreamBuilder<List<Pressure>>(
          stream: readPressure(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final pressure = snapshot.data;
              return Column(
                children: pressure!.map(buildPressureData).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: color4,
                ),
              );
            }
          })
    ]);
  }
}
