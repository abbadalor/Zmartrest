import 'package:flutter/material.dart';
import 'AppModel.dart';
import 'package:provider/provider.dart';

import 'ScanPage.dart';
import 'screens/Login.dart';
import 'screens/Home.dart';
import 'screens/SignUp.dart';
import 'screens/SignUpInfo.dart';
import 'screens/Test.dart';

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
      home: SignUp(),
      //home: SignUpInfo(),
      //home: Home(),
      //home: MyHomePage(),
    ),
  ));
}
