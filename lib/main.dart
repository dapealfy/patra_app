import 'dart:io';

import 'package:app/core/network/base_network.dart';
import 'package:app/core/router/routes_config.dart';
import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global = CoreHttpOverrides();
  runApp(const App());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pengaduan Keluhan Aset',
      routerConfig: routesConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}
