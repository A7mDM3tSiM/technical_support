import 'package:flutter/material.dart';
import 'package:technical_support/models/ticket/ticket_repo.dart';

import '../models/services/api_services.dart';

class TicketProvider extends ChangeNotifier {
  late var _apiResponse = ApiResponse.initial('init');

  ApiResponse get apiResponse => _apiResponse;

  TextEditingController topicController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  PersistentBottomSheetController? controller;

  bool isBottomSheetOpened = false;

  var toUpdateData = <String, dynamic>{};

  Future<void> setTicket(String? uid) async {
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

    notifyListeners();
  }

  Future<void> updateTicket(String? ticketId) async {
    try {
      _apiResponse = ApiResponse.loading("Loading...");
      notifyListeners();

      await TicketRepo().updateTicket(ticketId ?? "", toUpdateData);
      _apiResponse = ApiResponse.completed(null);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }

    notifyListeners();
  }

  void setToUpdateData(String key, dynamic value) {
    toUpdateData[key] = value;
    notifyListeners();
  }

  void _disposeControllers() {
    topicController.text = "";
    descriptionController.text = "";
  }

  /// This function is used to toggle the floating action button icon
  /// and close the bottom sheet
  void closeBottomSheet() {
    isBottomSheetOpened = false;
    if (controller != null) {
      controller?.close();
      controller = null;
    }
    notifyListeners();
  }

  /// This function is used to toggle the floating action button icon
  /// and has nothing to do with opening the bottomsheet
  void openBottomSheet() {
    isBottomSheetOpened = true;
    notifyListeners();
  }
}
