import 'package:flutter/material.dart';
import 'package:technical_support/components/routes/routes.dart';
import 'package:technical_support/models/services/api_services.dart';
import 'package:technical_support/models/services/navigation_service.dart';
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
      _userRepo.user = user;
      await getUserTickets();
      _apiResponse = ApiResponse.completed(user);
      NavigationService.push(Routes.homeRoute);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
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
