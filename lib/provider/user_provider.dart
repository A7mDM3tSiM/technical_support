import 'package:flutter/material.dart';
import 'package:technical_support/models/services/api_services.dart';
import 'package:technical_support/models/user/user_repo.dart';

import '../models/user/user_model.dart';

class UserProvider extends ChangeNotifier {
  late var _apiResponse = ApiResponse.initial('init');
  late final employees = <User>[];

  var emailController = TextEditingController();
  var passController = TextEditingController();

  ApiResponse get apiResponse => _apiResponse;

  Future<void> login() async {
    _apiResponse = ApiResponse.loading('Loading');
    notifyListeners();
    try {
      var user = await UserRepo().login(
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

  Future<void> getEmployees() async {
    try {
      _apiResponse = ApiResponse.loading('Loading...');
      notifyListeners();

      employees.addAll(
        await UserRepo().getUsers().then(
              (_filterUsersAndGetEmployees),
            ),
      );
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }

    _apiResponse = ApiResponse.completed(null);
    notifyListeners();
  }

  List<User> _filterUsersAndGetEmployees(List<User> allUsers) {
    final emplyee = <User>[];

    for (var user in allUsers) {
      if (user.type == UserType.agent) {
        emplyee.add(user);
      }
    }

    return emplyee;
  }

  void _disposeControllers() {
    emailController.text = "";
    passController.text = "";
  }
}
