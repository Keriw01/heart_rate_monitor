import 'package:flutter/material.dart';
import '../theme/styles.dart';
import '../api/pdf_api.dart';

class RaportPage extends StatefulWidget {
  const RaportPage({super.key});

  @override
  State<RaportPage> createState() => _RaportPageState();
}

class _RaportPageState extends State<RaportPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 48,
        ),
        ElevatedButton(
            onPressed: () async {
              final pdfFile = await PdfApi.generatePdf();

              PdfApi.openFile(pdfFile);
            },
            style: buttonElevatedStyle(),
            child: const Text("Generate"))
      ],
    );
  }
}
