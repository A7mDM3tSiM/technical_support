import 'dart:convert';

import 'package:technical_support/models/services/network_service.dart';

import '../ticket/ticket_model.dart';
import 'user_model.dart';

class UserRepo {
  /// contain the current user data
  late User user;
  late List<Ticket> userTickets;

  Future<User> login(String email, String pass) async {
    var response = await NetworkService.post(
      path: "login",
      data: {
        "email": email,
        "password": pass,
      },
    );
    return User.fromJson(response.data);
  }

  Future<void> logout() async {
    await NetworkService.get(path: "/logout");
  }

  Future<List<Ticket>> getUserTickets() async {
    var response = await NetworkService.get(
      path: "tickets",
      params: {
        "token": user.token,
      },
    );
    return response.data.map((json) => Ticket.fromJson(json)).toList();
  }
}
