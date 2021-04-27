import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../Components/Rr_chart.dart';
import '../Components/Rr_series.dart';

class Chart extends StatelessWidget {
  final List<RmssdSeries> data = [
    RmssdSeries(
      time: "13:30",
      rmssd: 550,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    RmssdSeries(
      time: "13:35",
      rmssd: 678,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    RmssdSeries(
      time: "13:40",
      rmssd: 283,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    RmssdSeries(
      time: "13:45",
      rmssd: 304,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    RmssdSeries(
      time: "13:50",
      rmssd: 231,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    RmssdSeries(
      time: "13:55",
      rmssd: 462,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    RmssdSeries(
      time: "14:00",
      rmssd: 234,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RrChart(
        data: data,
      )),
    );
  }
}
