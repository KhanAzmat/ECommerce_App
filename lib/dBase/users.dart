import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices {
  FirebaseDatabase database = FirebaseDatabase.instance;
  String ref = 'users';

  createUser(String uid, Map value) {
    database
        .reference()
        .child('$ref/$uid')
        .set(value)
        .catchError((e) => {print(e.toString())});
  }
}
