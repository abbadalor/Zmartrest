import 'package:zmartrest/models/zmartrestuser.dart';
import 'package:zmartrest/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference zmartrestuserCollection = FirebaseFirestore.instance.collection('zmartrestusers');

  Future<void> updateUserData(int age, String name, String lastname, String sex) async {
    return await zmartrestuserCollection.doc(uid).set({
      'age': age,
      'name': name,
      'lastname': lastname,
      'sex': sex,
    });
  }

  // zmartuser list from snapshot
  List<ZmartrestUser> _zmartrestuserListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      //print(doc.data);
      return ZmartrestUser(
        age: doc.data()['age'] ?? 0,
        name: doc.data()['name'] ?? '',
        lastname: doc.data()['lastname'] ?? '',
        sex: doc.data()['sex'] ?? ''
      );
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      age: snapshot.data()['age'],
      name: snapshot.data()['name'],
      lastname: snapshot.data()['lastname'],
      sex: snapshot.data()['sex']
    );
  }

  // get users stream
  Stream<List<ZmartrestUser>> get users {
    return zmartrestuserCollection.snapshots()
      .map(_zmartrestuserListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return zmartrestuserCollection.doc(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}