import 'package:flutter/material.dart';
import 'package:technical_support/components/routes/routes.dart';
import 'package:technical_support/models/services/navigation_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await Future.delayed(
          const Duration(
            seconds: 5,
          ),
        );
        NavigationService.pushReplacement(Routes.loginRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(h * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/app_icon.png",
              ),
              Image.asset(
                "assets/images/izdiad_text.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
