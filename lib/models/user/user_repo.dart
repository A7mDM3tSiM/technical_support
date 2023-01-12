import 'package:technical_support/models/services/network_service.dart';

import '../ticket/ticket_model.dart';
import 'user_model.dart';

class UserRepo {
  Future<User> login(String user, String pass) async {
    var response = await NetworkService.get(
      path: "/login",
      params: {
        "username": user,
        "password": pass,
      },
    );
    return User.fromJson(response.data);
  }

  Future<void> logout() async {
    await NetworkService.get(path: "/logout");
  }

  Future<List<Ticket>> getUserTickets(int id) async {
    var response = await NetworkService.get(
      path: "/getUserTicket",
      params: {
        "id": id,
      },
    );
    return response.data.map((json) => Ticket.fromJson(json)).toList();
  }
}
