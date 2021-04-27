import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class RmssdSeries {
  final String time;
  final int rmssd;
  final charts.Color barColor;

  RmssdSeries({
    @required this.time,
    @required this.rmssd,
    @required this.barColor,
  });
}
