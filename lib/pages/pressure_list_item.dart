import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/pressure.dart';
import '../theme/colors.dart';

TextStyle style =
    const TextStyle(color: color4, fontSize: 16, fontFamily: 'OpenSans');

Future<void> deletePressureData(String documentId) {
  var user = FirebaseAuth.instance.currentUser;
  return FirebaseFirestore.instance
      .collection('results_of_pressure')
      .doc(user?.email)
      .collection('results_pressure')
      .doc(documentId)
      .delete();
}

void handleDeletePressure(Pressure pressure) {
  deletePressureData(pressure.idElement);
}

Widget buildPressureData(Pressure pressure) {
  return GestureDetector(
    onLongPress: () {
      handleDeletePressure(pressure);
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            DateFormat('dd-MM-yyyy HH:mm').format(pressure.addDate),
            style: style,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${pressure.systolic}/${pressure.diastolic}',
                  style: style,
                ),
                const Text(
                  'mmHg',
                  style: TextStyle(color: color4, fontSize: 12),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              children: [
                Text(
                  pressure.pulse,
                  style: style,
                ),
                const Text(
                  'bpm',
                  style: TextStyle(color: color4, fontSize: 12),
                )
              ],
            ),
          ),
        ],
      ),
      //),
    ),
  );
}
