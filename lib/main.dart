import 'dart:io';

import 'package:app/core/di/auth_di.dart';
import 'package:app/core/network/base_network.dart';
import 'package:app/core/router/routes_config.dart';
import 'package:app/feature/profile/profile_viewmodel.dart';
import 'package:app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  HttpOverrides.global = CoreHttpOverrides();
  await configureAuthDependencies();
  runApp(const App());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(360, 640),
        splitScreenMode: false,
        useInheritedMediaQuery: true,
        builder: (ctx, child) {
          return ChangeNotifierProvider(
              create: (context) {
                return ProfileViewModel()..initialize();
              },
              lazy: false,
              builder: (context, child) {
                return MaterialApp.router(
                  title: 'Pengaduan Keluhan Aset',
                  routerConfig: routesConfig,
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    useMaterial3: true,
                  ),
                );
              });
        });
  }
}
