import 'package:flutter/material.dart';
import 'package:technical_support/models/services/api_services.dart';
import 'package:technical_support/models/user/user_repo.dart';

class LoginProvider extends ChangeNotifier {
  final _userRepo = UserRepo();
  late var _apiResponse = ApiResponse.initial('init');

  var emailController = TextEditingController();
  var passController = TextEditingController();

  ApiResponse get apiResponse => _apiResponse;

  Future<void> login() async {
    _apiResponse = ApiResponse.loading('Loading');
    notifyListeners();
    try {
      var user = await _userRepo.login(
        emailController.text,
        passController.text,
      );

      _disposeControllers();

      if (user != null) {
        _apiResponse = ApiResponse.completed(user);
      } else {
        _apiResponse = ApiResponse.error("Wrong email or password");
      }
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  void _disposeControllers() {
    emailController.text = "";
    passController.text = "";
  }

  Future<void> getUserTickets() async {
    try {
      var tickets = await _userRepo.getUserTickets();
      _userRepo.userTickets = tickets;
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
  }
}
