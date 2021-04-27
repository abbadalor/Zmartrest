import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:mdsflutter/Mds.dart';
import 'package:movesense_test/services/Library.dart';
import 'package:movesense_test/services/Data.dart';

// import 'dart:developer' as developer;

class DeviceModel extends ChangeNotifier {
  String _serial;
  String _name;

  String get name => _name;
  String get serial => _serial;

  int _accSubscription;
  String _accelerometerData = "";
  String get accelerometerData => _accelerometerData;
  bool get accelerometerSubscribed => _accSubscription != null;

  int _hrSubscription;
  String _hrData = "";
  String get hrData => _hrData;
  bool get hrSubscribed => _hrSubscription != null;

  bool _ledStatus = false;
  bool get ledStatus => _ledStatus;

  String _temperature = "";
  String get temperature => _temperature;

  int _time = 0;
  int get time => _time;

  DeviceModel(this._name, this._serial);

  String realTime = DateTime.now().microsecondsSinceEpoch.toString();

  final DataService _data = DataService();

  void subscribeToAccelerometer() {
    _accelerometerData = "";
    _accSubscription = Mds.subscribe(
        Mds.createSubscriptionUri(_serial, "/Meas/Acc/104"),
        "{}",
        (d, c) => {},
        (e, c) => {},
        (data) => _onNewAccelerometerData(data),
        (e, c) => {});
    notifyListeners();
  }

  void _onNewAccelerometerData(String data) {
    Map<String, dynamic> accData = jsonDecode(data);
    Map<String, dynamic> body = accData["Body"];
    List<dynamic> accArray = body["ArrayAcc"];
    dynamic acc = accArray.last;
    _accelerometerData = "x: " +
        acc["x"].toStringAsFixed(2) +
        "\ny: " +
        acc["y"].toStringAsFixed(2) +
        "\nz: " +
        acc["z"].toStringAsFixed(2);
    notifyListeners();
  }

  void unsubscribeFromAccelerometer() {
    Mds.unsubscribe(_accSubscription);
    _accSubscription = null;
    notifyListeners();
  }

  void subscribeToHr() {
    _hrData = "";
    _hrSubscription = Mds.subscribe(
        Mds.createSubscriptionUri(_serial, "/Meas/HR"),
        "{}",
        (d, c) => {putTime()},
        (e, c) => {},
        (data) => _onNewHrData(data),
        (e, c) => {});
    notifyListeners();
  }

  void _onNewHrData(String data) async {
    await getTime();
    _hrData = "";
    Map<String, dynamic> hrData = jsonDecode(data);
    Map<String, dynamic> body = hrData["Body"];
    double hr = body["average"];
    //int rr = body["rrData"][0];
    Map<String, int> rrMap = {"rr": body["rrData"][0], "time": time};
    rrList.add(rrMap);
    //print(rrList.toString());
    print("Here is the data");
    print(rrList.toString());
    _data.rrDataAdd();
    _hrData = _hrData +
        "bpm: " +
        hr.toStringAsFixed(0) +
        " rr: " +
        rrList[0].toString();

    notifyListeners();
  }

  void unsubscribeFromHr() {
    Mds.unsubscribe(_hrSubscription);
    _hrSubscription = null;
    notifyListeners();
  }

  void switchLed() {
    Map<String, bool> contract = new Map<String, bool>();
    contract["isOn"] = !_ledStatus;
    Mds.put(
        Mds.createRequestUri(_serial, "/Component/Led"), jsonEncode(contract),
        (data, code) {
      _ledStatus = !_ledStatus;
      notifyListeners();
    }, (e, c) => {});
  }

  void getTemperature() {
    Mds.get(Mds.createRequestUri(_serial, "/Meas/Temp"), "{}", (data, code) {
      double kelvin = jsonDecode(data)["Content"]["Measurement"];
      double temperatureVal = kelvin - 274.15;
      _temperature = temperatureVal.toStringAsFixed(1) + " C";
      notifyListeners();
    }, (e, c) => {});
  }

  void getTime() {
    Mds.get(Mds.createRequestUri(_serial, "/Time"), "{}", (data, code) {
      _time = jsonDecode(data)["Content"];
      notifyListeners();
    }, (e, c) => {});
  }

  void putTime() {
    Mds.put(Mds.createRequestUri(_serial, "/Time"), '{"value":${realTime}}', (data, code) {
    }, (e, c) => {});
  }
}
