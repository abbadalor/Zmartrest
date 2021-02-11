import 'package:zmartrest/models/zmartrestuser.dart';
import 'package:flutter/material.dart';

class ZmartrestUserTile extends StatelessWidget {

  final ZmartrestUser zmartrestuser;
  ZmartrestUserTile({ this.zmartrestuser });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[zmartrestuser.age],
          ),
          title: Text(zmartrestuser.name),
          subtitle: Text('${zmartrestuser.age} years old.'),
        ),
      ),
    );
  }
}