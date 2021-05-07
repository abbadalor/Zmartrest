import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
                          start: '14:35',
                          end: '15:00',
                          color: Colors.lightBlue.shade100,
                          text: 'Gympass',
                          textAngle: 0,
                        ),
                      ],
                    ),
                    primaryYAxis: NumericAxis(visibleMaximum: 60),
                    series: <ChartSeries>[
                      // Initialize line series
                      ColumnSeries<RmssdData, String>(
                          dataSource: [
                            RmssdData('13:30', 35, Colors.green),
                            RmssdData('13:35', 28, Colors.green),
                            RmssdData('13:40', 34, Colors.green),
                            RmssdData('13:45', 32, Colors.green),
                            RmssdData('13:50', 40, Colors.red),
                            RmssdData('13:55', 24, Colors.green),
                            RmssdData('14:00', 34, Colors.green),
                            RmssdData('14:05', 35, Colors.green),
                            RmssdData('14:10', 28, Colors.green),
                            RmssdData('14:15', 34, Colors.green),
                            RmssdData('14:20', 32, Colors.green),
                            RmssdData('14:30', 40, Colors.green),
                            RmssdData('14:35', 24, Colors.red),
                            RmssdData('14:40', 34, Colors.green),
                            RmssdData('14:45', 35, Colors.green),
                            RmssdData('14:50', 28, Colors.green),
                            RmssdData('14:55', 34, Colors.green),
                            RmssdData('15:00', 32, Colors.green),
                            RmssdData('15:05', 40, Colors.green),
                            RmssdData('15:10', 24, Colors.green),
                            RmssdData('15:15', 34, Colors.red),
                            RmssdData('15:20', 35, Colors.red),
                            RmssdData('15:25', 28, Colors.green),
                            RmssdData('15:30', 34, Colors.green),
                            RmssdData('15:35', 32, Colors.green),
                            RmssdData('15:40', 40, Colors.green),
                            RmssdData('15:45', 24, Colors.green),
                            RmssdData('15:50', 34, Colors.green),
                          ],
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
