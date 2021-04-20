import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movesense_test/services/library.dart';

class DataService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future userDataAdd(String fullname, String birthdate, String sex) async {
    return users
        .doc(userID)
        .set({'fullname': "Adam", 'birthdate': "20/09-2012", 'sex': "male"})
        //.set({'fullname': fullname, 'birthdate': birthdate, 'sex': sex})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
