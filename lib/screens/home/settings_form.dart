import 'package:zmartrest/models/user2.dart';
import 'package:zmartrest/services/database.dart';
import 'package:zmartrest/shared/constants.dart';
import 'package:zmartrest/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> age = [0, 1, 2, 3, 4];

  // form values
  int _currentAge;
  String _currentName;
  String _currentLastname;
  String _currentSex;

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userData = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Update your user settings.',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Please enter a lastname' : null,
                  onChanged: (val) => setState(() => _currentLastname = val),
                ),
                SizedBox(height: 10.0),
                DropdownButtonFormField(
                  value: _currentAge ?? 0,
                  decoration: textInputDecoration,
                  items: age.map((age) {
                    return DropdownMenuItem(
                      value: age,
                      child: Text('$age years old.'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentAge = val ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Please enter a sex' : null,
                  onChanged: (val) => setState(() => _currentSex = val),
                ),
                //SizedBox(height: 10.0),
                //Slider(
                //  value: (_currentAge ?? 100).toDouble(),
                //  activeColor: Colors.brown[_currentAge ?? 100],
                //  inactiveColor: Colors.brown[_currentAge ?? 100],
                //  min: 100.0,
                //  max: 900.0,
                //  divisions: 8,
                //  onChanged: (val) => setState(() => _currentAge = val.round()),
                //),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    print(_currentAge);
                    print(_currentName);
                    print(_currentLastname);
                    print(_currentSex);
                  }
                ),
              ],
            ),
          );
        } else {
          return Loading();
        }
      }
    );
  }
}