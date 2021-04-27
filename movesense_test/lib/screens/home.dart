import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Components/DeviceModel.dart';
import '../Components/NavDrawer.dart';
import '../Screens/Chart.dart';
import '../Screens/Exercise.dart';
import '../Components/Device.dart';
import '../Components/AppModel.dart';

Color mainColor = Color(0xff195670);

class Home extends StatefulWidget {
  final Device device;
  const Home(this.device);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  AppModel _appModel;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _appModel = Provider.of<AppModel>(context, listen: false);
    _appModel.onDeviceMdsDisconnected((device) => {Navigator.pop(context)});
  }

  void _onAccelerometerButtonPressed(DeviceModel deviceModel) {
    if (deviceModel.accelerometerSubscribed) {
      deviceModel.unsubscribeFromAccelerometer();
    } else {
      deviceModel.subscribeToAccelerometer();
    }
  }

  void _onHrButtonPressed(DeviceModel deviceModel) {
    if (deviceModel.hrSubscribed) {
      deviceModel.unsubscribeFromHr();
    } else {
      deviceModel.subscribeToHr();
    }
  }

  @override
  void dispose() {
    _appModel.disconnectFromDevice(widget.device);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Device device = widget.device;

    return ChangeNotifierProvider(
      create: (context) => DeviceModel(device.name, device.serial),
      child: Consumer<DeviceModel>(
        builder: (context, model, child) {
          final List<Widget> _children = [
            //WIDGETS:
            Column(
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                  child: _accelerometerItem(model),
                ),
                SizedBox(
                  height: 100.0,
                  child: _hrItem(model),
                ),
                SizedBox(
                  height: 100.0,
                  child: _ledItem(model),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                  child: Exercise(),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Chart(),
                  ),
                ),
              ],
            ),
          ];
          return Scaffold(
            appBar: AppBar(),
            drawer: NavDrawer(),
            floatingActionButton: ButtonTheme(
              minWidth: 100.0,
              height: 40.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: RaisedButton(
                child: Text(
                  "Disconnect",
                  style: TextStyle(color: mainColor),
                ),
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            backgroundColor: Colors.white,
            body: _children[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: onTabTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.directions_run_rounded,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.autorenew_rounded,
                  ),
                  label: '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _accelerometerItem(DeviceModel deviceModel) {
    String xyz = "";
    try {
      xyz = deviceModel.accelerometerData.split("\n")[0] +
          " " +
          deviceModel.accelerometerData.split("\n")[1] +
          " " +
          deviceModel.accelerometerData.split("\n")[2];
      // xyz = deviceModel.accelerometerData;
    } on RangeError catch (e) {
      xyz = "";
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: mainColor,
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Icon(
            Icons.directions_run_rounded,
            color: Colors.white,
            size: 35,
          ),
        ),
        title: Text(
          "Accelerometer",
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          xyz,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        trailing: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Text(deviceModel.accelerometerSubscribed
              ? "Stop measuring"
              : "Start measuring"),
          onPressed: () => _onAccelerometerButtonPressed(deviceModel),
        ),
      ),
    );
  }

  Widget _hrItem(DeviceModel deviceModel) {
    String bpm = "";
    try {
      bpm = "BPM: " + deviceModel.hrData.split(" ")[3];
    } on RangeError catch (e) {
      bpm = "";
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: mainColor,
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Icon(
            Icons.favorite,
            color: Colors.white,
            size: 35,
          ),
        ),
        title: Text(
          "Heart rate",
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          bpm,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        trailing: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Text(
              deviceModel.hrSubscribed ? "Stop measuring" : "Start measuring"),
          onPressed: () => _onHrButtonPressed(deviceModel),
        ),
      ),
    );
  }

  Widget _ledItem(DeviceModel deviceModel) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: mainColor,
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Icon(
            Icons.highlight,
            color: Colors.white,
            size: 35,
          ),
        ),
        title: Text(
          "Led",
          style: TextStyle(color: Colors.white),
        ),
        trailing: Switch(
          value: deviceModel.ledStatus,
          onChanged: (b) => {deviceModel.switchLed()},
          activeTrackColor: Colors.white,
          activeColor: Colors.white,
        ),
      ),
    );
  }

//   Widget _temperatureItem(DeviceModel deviceModel) {
//     return Card(
//       color: mainColor,
//       child: ListTile(
//         title: Text("Temperature"),
//         subtitle: Text(deviceModel.temperature),
//         trailing: RaisedButton(
//           child: Text("Get"),
//           onPressed: () => deviceModel.getTemperature(),
//         ),
//       ),
//     );
//   }
}
