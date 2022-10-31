import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/pressure.dart';

class RaportPage extends StatefulWidget {
  const RaportPage({super.key});

  @override
  State<RaportPage> createState() => _RaportPageState();
}

class _RaportPageState extends State<RaportPage> {
  Future<Pressure?> readPressure() async {
    final docUser = FirebaseFirestore.instance
        .collection('results_of_pressure')
        .doc('test3@o2.pl')
        .collection('results_pressure')
        .doc('1');
    final snapshot = await docUser.get();
    if (snapshot.exists) {
      return Pressure.fromJson(snapshot.data()!);
    }
    return null;
  }

  Widget buildPressureData(Pressure pressure) => ListTile(
        title: Text(
            '${pressure.systolic} ${pressure.diastolic} ${pressure.pulse}'),
        subtitle: Text(pressure.addDate.toIso8601String()),
      );

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
          height: MediaQuery.of(context).size.height - 150,
          child: FutureBuilder<Pressure?>(
              future: readPressure(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong! ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final pressure = snapshot.data;
                  return pressure == null
                      ? const Center(child: Text('no user'))
                      : buildPressureData(pressure);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }))
    ]);
  }
}
