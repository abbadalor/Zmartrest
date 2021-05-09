import 'package:flutter/material.dart';
import 'package:movesense_test/services/auth.dart';

Color mainColor = Color(0xff002e33);


class NavDrawer extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '   Zmartrest',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: mainColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.house),
            title: Text('Home'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.account_circle_rounded),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.local_phone),
            title: Text('Contact specialist '),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.sync_disabled_rounded),
            title: Text('Disconnect'),
            onTap: () => {
              Navigator.pop(context),
              Navigator.pop(context),
              },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              _auth.signOut(),
              Navigator.of(context).pop(),
              Navigator.of(context).pop(),
              Navigator.of(context).pop()
            },
          ),
        ],
      ),
    );
  }
}
