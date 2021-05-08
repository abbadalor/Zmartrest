import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Components/DeviceModel.dart';
import '../Components/NavDrawer.dart';
import '../Screens/Chart.dart';
import '../Screens/Exercise.dart';
import '../Screens/Calendar.dart';
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 300),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 300,
                    height: 250,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: _hrItem(model),
                ),
                SizedBox(
                  height: 50,
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
              mainAxisAlignment: MainAxisAlignment.start,
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

  Widget _hrItem(DeviceModel deviceModel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
      child: FlatButton(
        child: Text(
          deviceModel.hrSubscribed ? "Stop measuring" : "Start measuring",
          style: TextStyle(
            fontSize: 17.5,
          ),
        ),
        color: Color(0xff195670),
        textColor: Colors.white,
        minWidth: double.infinity,
        height: 50,
        onPressed: () => _onHrButtonPressed(deviceModel),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _ledItem(DeviceModel deviceModel) {
    return Switch(
      value: deviceModel.ledStatus,
      onChanged: (b) => {deviceModel.switchLed()},
      activeTrackColor: Colors.white,
      activeColor: Colors.white,
    );
  }
}
