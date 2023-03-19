import 'dart:convert';

import 'package:technical_support/models/services/network_service.dart';
import 'package:technical_support/models/ticket/ticket_model.dart';

class TicketRepo {
  Future<Ticket> getTicketDetails(int id) async {
    var response = await NetworkService.get(
      path: "/getTicketDetails",
      params: {
        "id": id,
      },
    );
    return Ticket.fromJson(jsonDecode(response.body));
  }

  Future<Ticket> createTicket(int id) async {
    var response = await NetworkService.get(
      path: "/createTicket",
      params: {
        "id": id,
      },
    );
    return Ticket.fromJson(jsonDecode(response.body));
  }

  Future<Ticket> updateTicket(int id) async {
    var response = await NetworkService.get(
      path: "/updateTicket",
      params: {
        "id": id,
      },
    );
    return Ticket.fromJson(jsonDecode(response.body));
  }

  Future<void> deleteTicket(int id) async {
    await NetworkService.get(
      path: "/deleteTicket",
      params: {
        "id": id,
      },
    );
  }
}
