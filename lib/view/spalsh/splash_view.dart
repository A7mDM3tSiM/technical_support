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
        // and checking the app status
        await Future.delayed(
          const Duration(
            seconds: 2,
          ),
        );
        _endSplashLoading();
      },
    );
  }

  // handeling the animation no real need for state mangement
  // for simple animation
  bool _splashLoading = true;

  void _endSplashLoading() {
    if (mounted) {
      setState(() {
        _splashLoading = false;
      });
    }
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
                height: h * 0.25,
                child: Image.asset(
                  "assets/images/app_icon.png",
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: h * 0.1,
                width: w * 0.7,
                child: Image.asset(
                  "assets/images/izdiad_text.png",
                ),
              ),
            ),
            AnimatedAlign(
              alignment:
                  _splashLoading ? const Alignment(0, -2.5) : Alignment.center,
              duration: const Duration(
                seconds: 1,
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
