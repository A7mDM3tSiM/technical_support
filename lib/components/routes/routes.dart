import 'package:technical_support/view/home/home_view.dart';

import '../../view/spalsh/splash_view.dart';
import '../../view/ticket/ticket_details_view.dart';

class Routes {
  // assign routes to static strings to avoid string confusion
  static String splashRoute = '/';
  static String loginRoute = '/login';
  static String homeRoute = '/home';
  static String ticketDetailsRoute = '/ticketDetails';

  /// a set contain all the app routes assigned to widgets
  // (_) is context but it's not needed
  static final routes = {
    splashRoute: (_) => const SplashView(),
    homeRoute: (_) => const HomeView(),
    ticketDetailsRoute: (_) => const TicketDetailsView(),
  };
}
