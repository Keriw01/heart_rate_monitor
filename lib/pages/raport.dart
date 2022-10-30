import 'package:flutter/material.dart';

class RaportPage extends StatefulWidget {
  const RaportPage({super.key});

  @override
  State<RaportPage> createState() => _RaportPageState();
}

class _RaportPageState extends State<RaportPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: MediaQuery.of(context).size.height / 100,
      child: ElevatedButton(onPressed: () {}, child: const Text('Utwórz')),
    );
  }
}
