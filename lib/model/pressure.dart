import 'package:cloud_firestore/cloud_firestore.dart';

class Pressure {
  final String systolic;
  final String diastolic;
  final String pulse;
  final DateTime addDate;
  Pressure(
      {required this.systolic,
      required this.diastolic,
      required this.pulse,
      required this.addDate});
  Map<String, dynamic> toJson() => {
        'systolic': systolic,
        'diastolic': diastolic,
        'pulse': pulse,
      };
  static Pressure fromJson(Map<String, dynamic> json) => Pressure(
      systolic: json['systolic'],
      diastolic: json['diastolic'],
      pulse: json['pulse'],
      addDate: (json['addDate'] as Timestamp).toDate());
}
