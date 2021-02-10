import 'package:flutter/material.dart';
import 'AppModel.dart';
import 'package:provider/provider.dart';

import 'ScanPage.dart';
import 'screens/login.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppModel(),
    child: MaterialApp(
      //home: ScanWidget(),
      home: Login(),
    ),
  ));
}
