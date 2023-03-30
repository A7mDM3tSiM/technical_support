import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_support/view/home/home_view.dart';
import 'package:technical_support/view/spalsh/splash_view.dart';

import 'models/user/user_model.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    if (user == null) {
      return const SplashView();
    } else {
      return const HomeView();
    }
  }
}
