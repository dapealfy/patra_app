import 'package:app/core/router/routes_name.dart';
import 'package:app/feature/auth/login/login_screen.dart';
import 'package:app/feature/auth/register/register_screen.dart';
import 'package:app/feature/home/complaint/create_complaint_screen.dart';
import 'package:app/feature/home/complaint/detail_complaint_screen.dart';
import 'package:app/feature/home/home_customer_screen.dart';
import 'package:app/feature/home/home_officer_screen.dart';
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
    ],
  ),

  //HOME ROUTE
  GoRoute(
    path: '/home-customer',
    name: RoutesName.homeCustomer,
    builder: (context, state) => const HomeCustomerScreen(),
    routes: [
      GoRoute(
        path: 'create-complaint',
        name: RoutesName.createComplaint,
        builder: (context, state) => const CreateComplaintScreen(),
      ),
      GoRoute(
        path: 'detail-complaint',
        name: RoutesName.detailComplaint,
        builder: (context, state) => DetailComplaintScreen(
          complaintId: state.uri.queryParameters['complaintId'].toString(),
        ),
      ),
    ],
  ),
  GoRoute(
    path: '/home-officer',
    name: RoutesName.homeOfficer,
    builder: (context, state) => const HomeOfficerScreen(),
    routes: [
      GoRoute(
        path: 'update-complaint',
        name: RoutesName.updateComplaint,
        builder: (context, state) => const CreateComplaintScreen(),
      ),
      GoRoute(
        path: 'detail-complaint-officer',
        name: RoutesName.detailComplaintOfficer,
        builder: (context, state) => DetailComplaintScreen(
          complaintId: state.uri.queryParameters['complaintId'].toString(),
        ),
      ),
    ],
  ),
]);
