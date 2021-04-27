import 'package:flutter/material.dart';
// import 'package:movesense_test/screens/SignUpInfo.dart';
import 'package:movesense_test/services/Auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color mainColor = Color(0xff195670);
  bool _isHidden = true;
  bool noUser = false;
  bool wrongPassword = false;
  bool usedEmail = false;
  bool weakPassword = false;
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/hrv.png',
                          width: 280,
                          height: 200,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "E-mail can't be empty";
                      } else if (noUser) {
                        return "No user found for that email";
                      } else if (usedEmail) {
                        return "That E-mail is already in use";
                      }
                      return null;
                    },
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
                    controller: _passwordController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Password can't be empty";
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      } else if (wrongPassword) {
                        return "Incorrect password";
                      }
                      return null;
                    },
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden ? Icons.visibility : Icons.visibility_off,
                          color: mainColor,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 151),
                  FlatButton(
                      child: Text(
                        'Sign in',
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
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          print(_emailController.text +
                              ' ' +
                              _passwordController.text);
                          dynamic result = await _auth.signIn(
                              _emailController.text.replaceAll(' ', ''),
                              _passwordController.text.replaceAll(' ', ''));
                          if (result == 'NoUser') {
                            noUser = true;
                            _formKey.currentState.validate();
                            noUser = false;
                          } else if (result == 'WrongPass') {
                            wrongPassword = true;
                            _formKey.currentState.validate();
                            wrongPassword = false;
                          } else {
                            print('signed in');
                            print(result);
                            Navigator.pushNamed(context, '/Connect');
                          }
                        }
                      }),
                  SizedBox(height: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/SignUpInfo');
                            },
                            child: Text(
                              " Sign up",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
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

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
