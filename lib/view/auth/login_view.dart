import 'package:flutter/material.dart';
import 'package:technical_support/components/routes/routes.dart';
import 'package:technical_support/models/services/navigation_service.dart';
import 'package:technical_support/view/widgets/global/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
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
                        color: Colors.grey[600],
                      ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(h * 0.005),
                    child: CustomTextField(
                      controller: TextEditingController(),
                      h: h * 0.1,
                      hint: 'User Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(h * 0.005),
                    child: CustomTextField(
                      controller: TextEditingController(),
                      h: h * 0.1,
                      hint: 'Password',
                      isPassword: true,
                      icon: Icons.visibility,
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                ElevatedButton(
                  onPressed: () {
                    NavigationService.push(Routes.homeRoute);
                  },
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: h * 0.015,
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
