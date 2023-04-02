import 'package:flutter/material.dart';
import 'package:technical_support/models/ticket/ticket_repo.dart';

import '../models/services/api_services.dart';

class TicketProvider extends ChangeNotifier {
  late var _apiResponse = ApiResponse.initial('init');

  ApiResponse get apiResponse => _apiResponse;

  TextEditingController topicController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  var toUpdateData = <String, dynamic>{};

  void setTicket(String? uid) async {
    try {
      _apiResponse = ApiResponse.loading("Loading...");
      notifyListeners();

      await TicketRepo().setTicket(
        uid,
        topicController.text,
        descriptionController.text,
      );

      _disposeControllers();
      _apiResponse = ApiResponse.completed(null);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
  }

  void updateTicket(String? ticketId) async {}

  void _disposeControllers() {
    topicController.text = "";
    descriptionController.text = "";
  }
}
