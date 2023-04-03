import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:technical_support/models/services/database_services.dart';

import 'user_model.dart' as u;

class UserRepo {
  final _auth = FirebaseAuth.instance;

  Stream<u.User?> get userData {
    return _auth.userChanges().map(_userFromFirebaseUser);
  }

  u.User? _userFromFirebaseUser(User? user) {
    if (user != null) {
      return u.User(
        uid: user.uid,
      );
    }
    return null;
  }

  Future<User?> login(String email, String pass) async {
    try {
      var response = await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );

      return response.user;
    } catch (e) {
      debugPrint("$e");
    }

    return null;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  // get all the users
  Future<List<u.User>> getUsers() async {
    try {
      return await DataBaseServiecs(collection: 'users').getUsers();
    } catch (e) {
      debugPrint("$e");
    }
    return [];
  }
}
