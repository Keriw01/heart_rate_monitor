import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Future getDataPressureForList() async {
  final user = FirebaseAuth.instance.currentUser;

  CollectionReference collectionReference = FirebaseFirestore.instance
      .collection('results_of_pressure')
      .doc(user?.email)
      .collection('results_pressure');

  QuerySnapshot snapshot = await collectionReference.orderBy('addDate').get();

  List<DocumentSnapshot> documents = snapshot.docs;

  return documents;
}

Future<List<PieChartSectionData>> listSpot() async {
  var documents = await getDataPressureForList();

  List<PieChartSectionData> listSpots = [];
  List<int> category = [0, 0, 0, 0, 0, 0];
  List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.greenAccent,
    Colors.orange,
    Colors.red,
    Colors.purple
  ];
  for (DocumentSnapshot document in documents) {
    int systolic = int.parse(document["systolic"]);
    int diastolic = int.parse(document["diastolic"]);
    if (systolic > 0 && systolic < 90 || diastolic > 0 && diastolic < 60) {
      category[0] += 1;
    } else if (systolic > 90 && systolic < 119 ||
        diastolic > 60 && diastolic < 77) {
      category[1] += 1;
    } else if (systolic > 120 && systolic < 129 ||
        diastolic > 78 && diastolic < 81) {
      category[2] += 1;
    } else if (systolic > 130 && systolic < 139 ||
        diastolic > 82 && diastolic < 89) {
      category[3] += 1;
    } else if (systolic > 140 && systolic < 179 ||
        diastolic > 90 && diastolic < 119) {
      category[4] += 1;
    } else if (systolic >= 180 || diastolic >= 120) {
      category[5] += 1;
    }
  }

  for (int i = 0; i < category.length; i++) {
    listSpots.add(PieChartSectionData(
        titleStyle: const TextStyle(fontWeight: FontWeight.bold),
        value: double.parse("${category[i]}"),
        color: colors[i]));
  }
  return listSpots;
}

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  late Future<List<PieChartSectionData>>? _listSpotsFuture;

  @override
  void initState() {
    super.initState();
    _listSpotsFuture = listSpot();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PieChartSectionData>>(
      future: _listSpotsFuture,
      builder: (BuildContext context,
          AsyncSnapshot<List<PieChartSectionData>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("Niedociśnienie")
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("W normie")
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("Podwyższone")
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                              color: Colors.orange,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("Niskie nadciśnienie")
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("Średnie nadciśnienie")
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                              color: Colors.purple,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("Znaczne nadciśnienie")
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                    height: 200,
                    width: 200,
                    child: PieChart(PieChartData(sections: snapshot.data!))),
              ],
            ),
          );
        }
      },
    );
  }
}
