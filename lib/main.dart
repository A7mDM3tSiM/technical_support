import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_support/models/user/user_model.dart';
import 'package:technical_support/models/user/user_repo.dart';
import 'package:technical_support/provider/login_provider.dart';
import 'package:technical_support/provider/ticket_provider.dart';

import 'components/routes/routes.dart';
import 'components/theme/theme.dart';
import 'components/theme/theme_manger.dart';
import 'models/services/navigation_service.dart';
import 'models/services/network_service.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  // Global Init
  WidgetsFlutterBinding.ensureInitialized();

  // init firebase
  await Firebase.initializeApp();

  // Init EasyLocalization
  await EasyLocalization.ensureInitialized();

  // Init navigation services
  await NavigationService.init();

  // Init Networkservices
  NetworkService.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeManegerProvider>(
          create: (_) => ThemeManegerProvider(),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider<TicketProvider>(
          create: (_) => TicketProvider(),
        ),
      ],
      child: Consumer<ThemeManegerProvider>(
        builder: (context, theme, _) {
          return StreamProvider<User?>.value(
            value: UserRepo().userData,
            initialData: null,
            builder: (context, snapshot) {
              return MaterialApp(
                routes: Routes.routes,
                initialRoute: Routes.wrapper,
                navigatorKey: NavigationService.navKey,
                scaffoldMessengerKey: scaffoldMessengerKey,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: theme.themeMode,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
