import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 0, 40.0, 0),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 100),
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
                  SizedBox(height: 184),
                  FlatButton(
                    child: Text(
                      'Continue',
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
                  SizedBox(height: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Have an account?",
                            style: TextStyle(
                              fontSize: 12.5,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              " Sign In",
                              style: TextStyle(
                                  fontSize: 12.5, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
