import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:technical_support/models/user/user_model.dart';

class DataBaseServiecs {
  String uid;
  String collection;

  late final CollectionReference<Map<String, dynamic>> _db;

  DataBaseServiecs({
    required this.uid,
    required this.collection,
  }) {
    _db = FirebaseFirestore.instance.collection(collection);
  }

  Future<void> setTicket(Map<String, dynamic> data) async {
    await _db.doc().set(data);
  }

  Stream<User> get userData {
    return _db.doc(uid).snapshots().map(_userFromFirebaseUser);
  }

  User _userFromFirebaseUser(DocumentSnapshot snapshot) {
    return User(
      uid: uid,
      name: snapshot['name'],
      email: snapshot['email'],
      type: snapshot['type'],
    );
  }
}
