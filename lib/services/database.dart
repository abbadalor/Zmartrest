import 'package:zmartrest/models/user2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future<void> updateUserData(int age, String name, String firstName, String sex) async {
    return await userCollection.document(uid).setData({
      'age': age,
      'name': name,
      'lastname': lastname,
      'sex': sex,
    });
  }

  // user list from snapshot
  List<User> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return User(
        age: doc.data['age'] ?? 0,
        name: doc.data['name'] ?? '',
        lastname: doc.data['lastname'] ?? '',
        sugars: doc.data['sex'] ?? ''
      );
    }).toList();
  }

  // get users stream
  Stream<List<User>> get users {
    return userCollection.snapshots()
      .map(_userListFromSnapshot);
  }

}