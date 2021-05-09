import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:movesense_test/services/library.dart';
import 'package:movesense_test/screens/chart.dart';

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
    var date = rmssdList.last["time"];
    var newdate = date.toString().replaceAll(".", "'");
    print(date);
    ref
        .child('Users')
        .child(userID)
        .child("rrData")
        .child(newdate)
        .set(rmssdList.last["rmssd"].toString());
  }

  Future rrToRmssd() async {
    double rmssd = 0;
    print("Rmssd data in list");
    for (var i=0; i<rrList.length; i++) {
      rmssd += rrList[i]["rr"];
    }
    rmssd = sqrt(rmssd / rrList.length);
    print(rrList.toString());
    Map<String, num> rmssdMap = {"rmssd": rmssd, "time": rrList[0]["time"]};
    rmssdList.add(rmssdMap);
    print("Rmssd data in list");
    print(rmssdList.toString());
    String minuteHourTime = DateFormat.Hm().format(DateTime.fromMicrosecondsSinceEpoch(rrList[0]["time"]));
    print("adding chartData");
    print(chartData.toString());
    chartData.add(RmssdData(minuteHourTime, rmssd, Colors.green));
    print(chartData.toString());
    rmssdTest = [];
    for (var i=0; i<chartData.length; i++) {
      rmssdTest.add(chartData[i].rmssd);
    }
    rrList.clear();
  }
}
