import 'package:flutter/material.dart';
import 'package:zmartrest/screens/wrapper.dart';
import 'package:zmartrest/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:zmartrest/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}