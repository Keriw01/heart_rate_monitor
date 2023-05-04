import 'package:cloud_firestore/cloud_firestore.dart';

class Pressure {
  String idElement;
  final String systolic;
  final String diastolic;
  final String pulse;
  final DateTime addDate;
  Pressure(
      {this.idElement = "",
      required this.systolic,
      required this.diastolic,
      required this.pulse,
      required this.addDate});
  void addIdElement(String idElement) {
    this.idElement = idElement;
  }

  Map<String, dynamic> toJson() => {
        'idElement': idElement,
        'systolic': systolic,
        'diastolic': diastolic,
        'pulse': pulse,
        'addDate': addDate,
      };
  static Pressure fromJson(Map<String, dynamic> json) => Pressure(
      idElement: json['idElement'],
      systolic: json['systolic'],
      diastolic: json['diastolic'],
      pulse: json['pulse'],
      addDate: (json['addDate'] as Timestamp).toDate());
}
