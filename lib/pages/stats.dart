import 'package:flutter/material.dart';
import 'package:heart_rate_monitor/pages/chart.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return const LineChartWidget();
  }
}
