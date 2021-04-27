import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movesense_test/services/library.dart';


class DataService {

  final fb = FirebaseDatabase.instance;


  //CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future userDataAdd(String fullname, String birthdate, String sex) async {
    final ref = fb.reference();
    ref.child('Users').child(userID).child('FullName').set(fullname);
    ref.child('Users').child(userID).child('Birthdate').set(birthdate);
    ref.child('Users').child(userID).child('Sex').set(sex);
    //return users
    //    .doc(userID)
    //    .set({
    //  'name': name,
    //  'lastname': lastname,
    //  'age': age,
    //  'sex': sex
    //})
    //.then((value) => print("User Added"))
    //.catchError((error) => print("Failed to add user: $error"));
  }

  Future rrDataAdd() async {
    final ref = fb.reference();
    var date = DateTime.fromMicrosecondsSinceEpoch(rrList.last["time"]);
    var newdate = date.toString().replaceAll(".", "'");
    print(date);
    ref.child('Users').child(userID).child("rrData").child(newdate).set(rrList.last["rr"].toString());
  }
}