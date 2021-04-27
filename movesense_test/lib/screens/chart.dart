import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'rr_chart.dart';
import 'rr_series.dart';

class Chart extends StatelessWidget {
  final List<RrSeries> data = [
    RrSeries(
      time: "13:30",
      rr: 550,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    RrSeries(
      time: "13:35",
      rr: 678,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    RrSeries(
      time: "13:40",
      rr: 283,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    RrSeries(
      time: "13:45",
      rr: 304,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    RrSeries(
      time: "13:50",
      rr: 231,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    RrSeries(
      time: "13:55",
      rr: 462,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    RrSeries(
      time: "14:00",
      rr: 234,
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
