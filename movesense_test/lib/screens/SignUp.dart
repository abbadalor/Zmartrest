import 'package:flutter/material.dart';
import 'package:movesense_test/screens/Login.dart';
import 'package:movesense_test/services/auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Color mainColor = Color(0xff195670);
  bool _isHidden1 = true;
  bool _isHidden2 = true;
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
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Form(
            key: _formKey,
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
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          print(_emailController.text +
                              ' ' +
                              _passwordController.text);
                          dynamic result = await _auth.register(
                              _emailController.text.replaceAll(' ', ''),
                              _passwordController.text.replaceAll(' ', ''));
                          if (result == 'WeakPass') {
                            weakPassword = true;
                            _formKey.currentState.validate();
                            weakPassword = false;
                          } else if (result == 'UsedEmail') {
                            usedEmail = true;
                            _formKey.currentState.validate();
                            usedEmail = false;
                          } else {
                            print('signed in');
                            print(result);
                            Navigator.pushNamed(context, '/Home');
                          }
                        }
                      }),
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
