import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class RrSeries {
  final String time;
  final int rr;
  final charts.Color barColor;

  RrSeries({
    @required this.time,
    @required this.rr,
    @required this.barColor,
  });
}
