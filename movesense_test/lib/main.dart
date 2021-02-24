import 'package:flutter/material.dart';
import 'AppModel.dart';
import 'package:provider/provider.dart';

import 'ScanPage.dart';
import 'screens/login.dart';
import 'screens/home.dart';

Color mainColor = Color(0xff195670);
void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppModel(),
    child: MaterialApp(
      theme: ThemeData(
        primaryColor: mainColor,
      ),
      //home: ScanWidget(),
      //home: Login(),
      home: Home(),
    ),
  ));
}
