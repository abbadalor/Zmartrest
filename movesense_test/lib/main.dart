import 'package:flutter/material.dart';
import 'AppModel.dart';
import 'package:provider/provider.dart';

import 'ScanPage.dart';
import 'screens/Login.dart';
import 'screens/Home.dart';
import 'screens/SignUp.dart';
import 'screens/SignUpInfo.dart';

Color mainColor = Color(0xff195670);
void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppModel(),
    child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: mainColor,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            brightness: Brightness.light,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        initialRoute: '/Home',
        routes: {
          '/': (context) => Login(),
          '/SignUpInfo': (context) => SignUpInfo(),
          '/SignUp': (context) => SignUp(),
          '/Home': (context) => Home(),
        }
        //home: ScanWidget(),
        //home: Login(),
        //home: SignUp(),
        //home: SignUpInfo(),
        //home: Home(),
        ),
  ));
}
