import 'package:flutter/material.dart';
import 'package:zmartrest/screens/authenticate/authenticate.dart';
import 'package:zmartrest/screens/home/home.dart';
import 'package:zmartrest/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<TheUser>(context);
    print(user);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }
    
  }
}