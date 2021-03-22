import 'package:flutter/material.dart';
import 'package:movesense_test/screens/Login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Color mainColor = Color(0xff195670);
  bool _isHidden1 = true;
  bool _isHidden2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 100 - kToolbarHeight),
                  Row(
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      suffix: SizedBox(height: 24),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    obscureText: _isHidden1,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      suffix: InkWell(
                        onTap: _togglePasswordView1,
                        child: Icon(
                          _isHidden1 ? Icons.visibility : Icons.visibility_off,
                          color: mainColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    obscureText: _isHidden2,
                    decoration: InputDecoration(
                      labelText: 'Confirm password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      suffix: InkWell(
                        onTap: _togglePasswordView2,
                        child: Icon(
                          _isHidden2 ? Icons.visibility : Icons.visibility_off,
                          color: mainColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 150),
                  FlatButton(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 17.5,
                      ),
                    ),
                    color: mainColor,
                    textColor: Colors.white,
                    minWidth: double.infinity,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {},
                  ),
                  SizedBox(height: 6),
                  /*IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      }),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView1() {
    setState(() {
      _isHidden1 = !_isHidden2;
    });
  }

  void _togglePasswordView2() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }
}
