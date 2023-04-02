import 'package:technical_support/models/services/database_services.dart';
import 'package:technical_support/models/ticket/ticket_model.dart';

class TicketRepo {
  Future<void> setTicket(String? uid, String topic, String description) async {
    final db = DataBaseServiecs(uid: uid ?? "", collection: "tickets");
    db.setTicket(
      {
        'topic': topic,
        'description': description,
        'status': 'un solved',
        'priority': 'high',
        'assignedUser': '',
      },
    );
  }

  Future<void> updateTicket(String ticketId, Map<String, dynamic> data) async {
    await DataBaseServiecs(collection: "tickets").updateTicket(
      ticketId,
      data,
    );
  }

  Stream<List<Ticket>> get ticketList {
    return DataBaseServiecs(collection: 'tickets').ticketsList;
  }
}
