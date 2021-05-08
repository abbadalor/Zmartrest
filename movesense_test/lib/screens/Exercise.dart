import 'package:flutter/material.dart';

Color mainColor = Color(0xff195670);

class Exercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Exercises",
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
