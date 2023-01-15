import 'package:flutter/material.dart';
import 'package:technical_support/view/widgets/splash/login_container_widget.dart';

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
        // simulating api call for getting app details
        await Future.delayed(
          const Duration(
            seconds: 4,
          ),
        );
        _endSplashLoading();
      },
    );
  }

  bool _splashLoading = true;

  void _endSplashLoading() {
    setState(
      () {
        _splashLoading = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                height: h * 0.4,
                child: Image.asset(
                  "assets/images/app_icon.png",
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: h * 0.1,
                width: w * 0.8,
                child: Image.asset(
                  "assets/images/izdiad_text.png",
                ),
              ),
            ),
            AnimatedAlign(
              alignment:
                  _splashLoading ? const Alignment(0, -2.5) : Alignment.center,
              duration: const Duration(
                milliseconds: 300,
              ),
              curve: Curves.fastOutSlowIn,
              child: const LoginConatinerWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
