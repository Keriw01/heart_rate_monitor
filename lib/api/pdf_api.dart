import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

final user = FirebaseAuth.instance.currentUser;

class PdfApi {
  static Future<File> generatePdf() async {
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection('results_of_pressure')
        .doc(user?.email)
        .collection('results_pressure');

    QuerySnapshot snapshot = await collectionReference.orderBy('addDate').get();
    List<DocumentSnapshot> documents = snapshot.docs;

    final pdf = Document();
    List<TableRow> rows = [];
    for (DocumentSnapshot document in documents) {
      Timestamp timestamp = document["addDate"];
      DateTime dateTime = timestamp.toDate();

      TableRow dataRow = TableRow(
        children: [
          Expanded(
            child: Text(
              DateFormat("EE, dd MMM yyyy, HH:mm").format(dateTime),
              textAlign: TextAlign.center,
            ),
            flex: 2,
          ),
          Expanded(
            child: Text(
                "${document["systolic"]}/${document["diastolic"]}   ${document["pulse"]}",
                textAlign: TextAlign.center),
            flex: 1,
          ),
        ],
      );
      rows.add(dataRow);
    }

    pdf.addPage(
      MultiPage(
          build: (Context context) => <Widget>[
                Table(
                  border: TableBorder.all(color: PdfColors.black),
                  children: [
                    TableRow(
                      children: [
                        Text(
                          "Czas",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'BP/HR',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    ...rows,
                  ],
                )
              ]),
    );

    return saveDocument(name: 'heart_rates.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
