import 'package:zmartrest/models/user2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final users = Provider.of<List<User>>(context);
    users.forEach((user) {
      print(user.name);
      print(user.sugars);
    });

    return Container(
      
    );
  }
}