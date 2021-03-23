import 'package:flutter/material.dart';
import 'AppModel.dart';
import 'package:provider/provider.dart';
import 'ScanPage.dart';
import 'screens/Login.dart';
import 'screens/Home.dart';
import 'screens/SignUp.dart';
import 'screens/SignUpInfo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  Color mainColor = Color(0xff195670);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(); //something wrong
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          runApp(ChangeNotifierProvider(
            create: (context) => AppModel(),
            child: MaterialApp(
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  primaryColor: mainColor,
                  appBarTheme: AppBarTheme(
                    color: Colors.white,
                    elevation: 0,
                    brightness: Brightness.light,
                    iconTheme: IconThemeData(color: Colors.black),
                  ),
                ),
                initialRoute: '/Home',
                routes: {
                  '/': (context) => Login(),
                  '/SignUpInfo': (context) => SignUpInfo(),
                  '/SignUp': (context) => SignUp(),
                  '/Home': (context) => Home(),
                }
                //home: ScanWidget(),
                //home: Login(),
                //home: SignUp(),
                //home: SignUpInfo(),
                //home: Home(),
                ),
          ));
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(); //loading
      },
    );
  }
}
