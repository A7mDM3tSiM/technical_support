import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:technical_support/models/user/user_model.dart';

import '../ticket/ticket_model.dart';

class DataBaseServiecs {
  String? uid;
  String collection;

  late final CollectionReference<Map<String, dynamic>> _db;

  DataBaseServiecs({
    this.uid,
    required this.collection,
  }) {
    _db = FirebaseFirestore.instance.collection(collection);
  }

  Future<void> setTicket(Map<String, dynamic> data) async {
    await _db.doc().set(data);
  }

  Future<void> updateTicket(String ticketId, Map<String, dynamic> data) async {
    await _db.doc(ticketId).update(data);
  }

  Stream<User> get userData {
    return _db.doc(uid).snapshots().map(_userFromFirebaseUser);
  }

  Stream<List<Ticket>> get ticketsList {
    return _db.snapshots().map(_ticketFromFirebaseTickets);
  }

  User _userFromFirebaseUser(DocumentSnapshot snapshot) {
    return User(
      uid: uid ?? '',
      name: snapshot['name'],
      email: snapshot['email'],
      type: snapshot['type'],
    );
  }

  List<Ticket> _ticketFromFirebaseTickets(QuerySnapshot snapshot) {
    return snapshot.docs.map(
      (doc) {
        return Ticket(
          id: snapshot.docs.first.id,
          topic: doc['topic'],
          description: doc['description'],
          status: doc['status'],
          priority: doc['priority'],
          assignedUser: doc['assignedUser'],
        );
      },
    ).toList();
  }
}
