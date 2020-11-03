import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'Device.dart';
import 'DeviceConnectionStatus.dart';
import 'DeviceInteractionWidget.dart';
import 'AppModel.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class ScanWidget extends StatefulWidget {
  @override
  _ScanWidgetState createState() => _ScanWidgetState();
}

class _ScanWidgetState extends State<ScanWidget> {

  AppModel model;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    model = Provider.of<AppModel>(context, listen: false);
    model.onDeviceMdsConnected((device) => {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          DeviceInteractionWidget(device)
      ))
    });
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;

    if (defaultTargetPlatform == TargetPlatform.android) {
      Permission.locationWhenInUse.isUndetermined.then((value) =>
          Permission.locationWhenInUse.request()
      );

      Permission.locationWhenInUse.isDenied.then((value) =>
          Permission.locationWhenInUse.request()
      );
    }
  }

  Widget _buildDeviceItem(BuildContext context, int index) {
    return Card(
      child: ListTile(
        title: Text(model.deviceList[index].name),
        subtitle: Text(model.deviceList[index].address),
        trailing: Text(model.deviceList[index].connectionStatus.statusName),
        onTap: () => model.connectToDevice(model.deviceList[index]),
      ),
    );
  }

  Widget _buildDeviceList(List<Device> deviceList) {
    return new Expanded(child: new ListView.builder(
        itemCount: model.deviceList.length,
        itemBuilder: (BuildContext context, int index) => _buildDeviceItem(context, index)
    )
    );
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
      appBar: AppBar(
        title: Text('Movesense Sensor'),
        centerTitle: true,
        backgroundColor: Colors.red[800],
      ),
      body: Consumer<AppModel>(
        builder: (context, model, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: onScanButtonPressed,
                color: Colors.grey[700],
                child: Text(model.scanButtonText),
              ),
              _buildDeviceList(model.deviceList)
            ],
          );
        },
      ),
      backgroundColor: Colors.grey[800],
    );
  }
}