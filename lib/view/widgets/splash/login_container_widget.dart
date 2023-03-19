import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_support/provider/login_provider.dart';

import '../../../models/services/api_services.dart';
import '../fileds/login_text_field.dart';

class LoginConatinerWidget extends StatelessWidget {
  const LoginConatinerWidget({super.key});

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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(h * 0.01),
              child: Consumer<LoginProvider>(
                builder: (_, login, __) => CustomTextField(
                  controller: login.emailController,
                  h: h * 0.05,
                  hint: 'Email',
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
                builder: (_, login, __) => CustomTextField(
                  controller: login.passController,
                  h: h * 0.05,
                  hint: 'Password',
                  isPassword: true,
                  icon: Icons.visibility,
                ),
              ),
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Consumer<LoginProvider>(
            builder: (_, login, __) => ElevatedButton(
              onPressed: () => login.login(),
              child: login.apiResponse.status == Status.loading
                  ? const CircularProgressIndicator.adaptive()
                  : Text(
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
