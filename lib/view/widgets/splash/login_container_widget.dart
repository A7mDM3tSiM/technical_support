import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_support/provider/login_provider.dart';

import '../../../models/services/api_services.dart';

class LoginConatinerWidget extends StatelessWidget {
  const LoginConatinerWidget({super.key});
  static final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Container(
      width: w * 0.85,
      padding: EdgeInsets.symmetric(vertical: h * 0.05),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
        borderRadius: BorderRadius.circular(h * 0.01),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Login",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: h * 0.05,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Form(
            key: _key,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(h * 0.01),
                    child: Consumer<LoginProvider>(
                      builder: (_, login, __) => TextFormField(
                        controller: login.emailController,
                        validator: (val) => val != null && !val.contains("@")
                            ? "Should be a vaild email"
                            : null,
                        style:
                            TextStyle(color: Colors.white, fontSize: h * 0.02),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(h * 0.01),
                    child: Consumer<LoginProvider>(
                      builder: (_, login, __) => TextFormField(
                        controller: login.passController,
                        validator: (val) => val != null && val.length < 6
                            ? "Should be over 6 charachters"
                            : null,
                        style:
                            TextStyle(color: Colors.white, fontSize: h * 0.02),
                        obscureText: true,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Consumer<LoginProvider>(
            builder: (_, login, __) => login.apiResponse.status ==
                    Status.loading
                ? const CircularProgressIndicator.adaptive()
                : ElevatedButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_key.currentState != null) {
                        if (_key.currentState!.validate()) {
                          login.login();
                        }
                      }
                    },
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: h * 0.015,
                            color: Colors.white,
                          ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
