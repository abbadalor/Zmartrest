import 'package:flutter/material.dart';
import 'Rr_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class RrChart extends StatelessWidget {
  final List<RmssdSeries> data;
  RrChart({@required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<RmssdSeries, String>> series = [
      charts.Series(
        id: "rr",
        data: data,
        domainFn: (RmssdSeries series, _) => series.time,
        measureFn: (RmssdSeries series, _) => series.rmssd,
        colorFn: (RmssdSeries series, _) => series.barColor,
      ),
    ];
    return Container(
        height: 500,
        padding: EdgeInsets.all(20),
        child: Card(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("RR data",
                    style: Theme.of(context).textTheme.bodyText2),
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ));
  }
}
