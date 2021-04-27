import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:movesense_test/rrData.dart';
import 'package:movesense_test/rrData.dart';

Color mainColor = Color(0xff195670);

class Eval extends StatelessWidget {
  final List<RrData> data;
  @override
  Eval({@required this.data});
  Widget build(BuildContext context) {
    List<charts.Series<RrData, String>> series = [
      charts.Series(
        id: 'RR',
        data: data,
        domainFn: (RrData series, _) => series.time,
        measureFn: (RrData series, _) => series.rr,
        colorFn: (RrData series, _) => series.barColor,
      )
    ];
    return Scaffold(
      body: Center(
        child: charts.BarChart(series),
      ),
    );
  }
}
