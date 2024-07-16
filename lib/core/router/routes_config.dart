import 'package:app/core/router/routes_name.dart';
import 'package:app/feature/onboarding/first_screen.dart';
import 'package:app/feature/onboarding/landing_screen.dart';
import 'package:app/main.dart';
import 'package:go_router/go_router.dart';

final routesConfig = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: RoutesName.splash,
      builder: (context, state) => const FirstScreen(),
    ),
    GoRoute(
      path: RoutesName.landing,
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(
      path: RoutesName.login,
      builder: (context, state) => const FirstScreen(),
    ),
  ]
);