import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

List<RmssdData> chartData = [];

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 700,
        padding: EdgeInsets.all(10),
        child: Card(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text("Rmssd", style: Theme.of(context).textTheme.bodyText2),
              ),
              Expanded(
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      labelPlacement: LabelPlacement.betweenTicks,
                      interval: 6,
                      plotBands: <PlotBand>[
                        PlotBand(
                          isVisible: true,
                          start: '13:30',
                          end: '15:00',
                          color: Colors.lightBlue.shade100,
                          text: 'Gympass',
                          textAngle: 0,
                          verticalTextAlignment: TextAnchor.start,
                          textStyle: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    primaryYAxis: NumericAxis(visibleMaximum: 60),
                    series: <ChartSeries>[
                      // Initialize line series
                      ColumnSeries<RmssdData, String>(
                          dataSource: chartData,
                          xValueMapper: (RmssdData sales, _) => sales.time,
                          yValueMapper: (RmssdData sales, _) => sales.rmssd,
                          pointColorMapper: (RmssdData data, _) => data.color)
                    ]),
              )
            ],
          ),
        ));
  }
}

class RmssdData {
  RmssdData(this.time, this.rmssd, this.color);
  final String time;
  final double rmssd;
  final Color color;
}
