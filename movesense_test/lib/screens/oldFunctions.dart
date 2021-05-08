/*Widget _hrItem(DeviceModel deviceModel) {
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
            deviceModel.hrSubscribed ? "Stop measuring" : "Start measuring"),
        onPressed: () => _onHrButtonPressed(deviceModel),
      ),
    ),
  );
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(deviceModel.accelerometerSubscribed
            ? "Stop measuring"
            : "Start measuring"),
        onPressed: () => _onAccelerometerButtonPressed(deviceModel),
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

    Widget _temperatureItem(DeviceModel deviceModel) {
    return Card(
      color: mainColor,
      child: ListTile(
        title: Text("Temperature"),
        subtitle: Text(deviceModel.temperature),
        trailing: RaisedButton(
          child: Text("Get"),
          onPressed: () => deviceModel.getTemperature(),
        ),
      ),
    );
  }

*/
