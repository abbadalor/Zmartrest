import 'package:zmartrest/models/zmartrestuser.dart';
import 'package:zmartrest/screens/home/zmartrestuser_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ZmartrestUserList extends StatefulWidget {
  @override
  _ZmartrestUserListState createState() => _ZmartrestUserListState();
}

class _ZmartrestUserListState extends State<ZmartrestUserList> {
  @override
  Widget build(BuildContext context) {

    final zmartrestusers = Provider.of<List<ZmartrestUser>>(context) ?? [];
    
    return ListView.builder(
      itemCount: zmartrestusers.length,
      itemBuilder: (context, index) {
        return ZmartrestUserTile(zmartrestuser: zmartrestusers[index]);
      },
    );
  }
}