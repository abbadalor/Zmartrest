import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:movesense_test/Components/Device.dart';
import 'package:movesense_test/Components/DeviceConnectionStatus.dart';
import 'package:movesense_test/screens/Home.dart';
import 'package:movesense_test/Components/AppModel.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:movesense_test/services/auth.dart';

class Connect extends StatefulWidget {
  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  AppModel model;
  Color mainColor = Color(0xff195670);
  String headlineText = "Connect to a sensor";
  final AuthService _auth = AuthService();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    model = Provider.of<AppModel>(context, listen: false);
    model.onDeviceMdsConnected((device) => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home(device)))
        });
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;

    if (defaultTargetPlatform == TargetPlatform.android) {
      Permission.locationWhenInUse.isUndetermined
          .then((value) => Permission.locationWhenInUse.request());

      Permission.locationWhenInUse.isDenied
          .then((value) => Permission.locationWhenInUse.request());
    }
  }

  Widget _buildDeviceItem(BuildContext context, int index) {
    return Card(
      child: ListTile(
        title: Text(
          model.deviceList[index].name,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.grey[700],
          ),
        ),
        subtitle: Text(model.deviceList[index].address),
        // trailing: Text(
        //   "Press to connect",
        //   style: TextStyle(
        //     fontSize: 13.0,
        //     color: mainColor,
        //   ),
        // ),
        trailing: Text(model.deviceList[index].connectionStatus.statusName),
        onTap: () => [
          model.connectToDevice(model.deviceList[index]),
        ],
      ),
    );
  }

  Widget _buildDeviceList(List<Device> deviceList) {
    return new Expanded(
        child: new ListView.builder(
            itemCount: model.deviceList.length,
            itemBuilder: (BuildContext context, int index) =>
                _buildDeviceItem(context, index)));
  }

  void onScanButtonPressed() {
    if (model.isScanning) {
      model.stopScan();
    } else {
      model.startScan();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<AppModel>(
        builder: (context, model, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 300,
                height: 250,
              ),
              Text(
                headlineText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.grey[700],
                ),
              ),
              _buildDeviceList(model.deviceList),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 30.0),
                child: FlatButton(
                  child: Text(
                    model.scanButtonText,
                    style: TextStyle(
                      fontSize: 17.5,
                    ),
                  ),
                  color: mainColor,
                  textColor: Colors.white,
                  minWidth: double.infinity,
                  height: 50,
                  onPressed: onScanButtonPressed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          );
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
                title: const Text('Sample Code'),
                leading: GestureDetector(
                  onTap: () => {
                    _auth.signOut(),
                    Navigator.of(context).pop()
                  },
                  child: Icon(
                    Icons.exit_to_app, // add custom icons also
                  ),
                ),
      ),
    );
  }
}
