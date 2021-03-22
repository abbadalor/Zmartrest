import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SignUpInfo extends StatefulWidget {
  @override
  _SignUpInfoState createState() => _SignUpInfoState();
}

class _SignUpInfoState extends State<SignUpInfo> {
  Color mainColor = Color(0xff195670);
  DateTime selectedDate = DateTime.now();
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
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
                      suffix: SizedBox(height: 24),
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
                      suffix: SizedBox(height: 24),
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: AbsorbPointer(
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          labelText: 'Birthdate',
                          //_textEditingController.txt = "${selectedDate.toLocal()}".split(' ')[0],
                          //"${selectedDate.toLocal()}".split(' ')[0],
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          suffix: SizedBox(height: 24),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 150),
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/SignUp');
                    },
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
                              fontSize: 15,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              " Sign In",
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

  _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
    }
  }

  /// This builds material date picker in Android
  buildMaterialDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      //initialDatePickerMode: DatePickerMode.year,
      helpText: 'SELECT BIRTHDATE',
      fieldLabelText: 'Enter birthdate',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: mainColor,
            accentColor: mainColor,
            colorScheme: ColorScheme.light(primary: mainColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _textEditingController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
  }

  /// This builds cupertion date picker in iOS
  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate)
                  setState(() {
                    selectedDate = picked;
                    _textEditingController.text =
                        "${selectedDate.toLocal()}".split(' ')[0];
                  });
              },
              initialDateTime: selectedDate,
              minimumYear: 1900,
              maximumYear: 2025,
            ),
          );
        });
  }
}
