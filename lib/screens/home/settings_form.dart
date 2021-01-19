import 'package:zmartrest/shared/constants.dart';
import 'package:flutter/material.dart';

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
          SizedBox(height: 10.0),
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
  }
}