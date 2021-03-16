import 'package:flutter/material.dart';

class SignUpInfo extends StatefulWidget {
  @override
  _SignUpInfoState createState() => _SignUpInfoState();
}

class _SignUpInfoState extends State<SignUpInfo> {
  Color mainColor = Color(0xff195670);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                      labelText: 'Firstname',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Lastname',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirm password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(height: 200),
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
}
