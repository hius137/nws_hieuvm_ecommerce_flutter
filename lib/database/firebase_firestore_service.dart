import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/user/user_entity.dart';

class FireStoreService{
  // final CollectionReference _usersCollectionReference =
  // FirebaseFirestore.instance.collection('users');

  final db = FirebaseFirestore.instance;

  void addUser(){
    final user = <String, dynamic>{
      "email": "hieu@gmail.com",
      "password": "123456",
      "name": 'hieu'
    };
    // Add a new document with a generated ID
    db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  // Future createUser(UserEntity user) async {
  //   try {
  //     await _usersCollectionReference.doc(user.id).set(user.toJson());
  //   } catch (e) {
  //     if (e is PlatformException) {
  //       return e.message;
  //     }
  //
  //     return e.toString();
  //   }
  // }
}