import 'package:flutter/material.dart';
import 'rr_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class RrChart extends StatelessWidget {
  final List<RrSeries> data;
  RrChart({@required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<RrSeries, String>> series = [
      charts.Series(
        id: "rr",
        data: data,
        domainFn: (RrSeries series, _) => series.time,
        measureFn: (RrSeries series, _) => series.rr,
        colorFn: (RrSeries series, _) => series.barColor,
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
