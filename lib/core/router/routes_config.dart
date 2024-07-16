import 'package:app/core/router/routes_name.dart';
import 'package:app/feature/auth/login/login_screen.dart';
import 'package:app/feature/auth/register/register_screen.dart';
import 'package:app/feature/onboarding/first_screen.dart';
import 'package:app/feature/onboarding/landing_screen.dart';
import 'package:app/main.dart';
import 'package:go_router/go_router.dart';

final routesConfig =
    GoRouter(navigatorKey: navigatorKey, initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: RoutesName.splash,
    builder: (context, state) => const FirstScreen(),
  ),
  GoRoute(
      path: '/landing',
      name: RoutesName.landing,
      builder: (context, state) => const LandingScreen(),
      routes: [
        GoRoute(
          path: 'login',
          name: RoutesName.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: 'register',
          name: RoutesName.register,
          builder: (context, state) => const RegisterScreen(),
        ),
      ]),
]);
