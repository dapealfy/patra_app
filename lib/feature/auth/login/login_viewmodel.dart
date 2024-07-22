import 'package:app/core/di/service_locator.dart';
import 'package:app/core/router/routes_name.dart';
import 'package:app/core/storage/local_storage.dart';
import 'package:app/data/auth/model/user_model.dart';
import 'package:app/data/auth/repository/auth_repository.dart';
import 'package:app/feature/profile/profile_viewmodel.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends ChangeNotifier {
  late final AuthRepository _authRepository = serviceLocator.get();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LocalStorageService storage = LocalStorageService.instance;

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }

  void login() async {
    bool isEmailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    if (emailController.text.isNotEmpty &&
        isEmailValid &&
        passwordController.text.length >= 8) {
      final response = await _authRepository.loginUser(
          emailController.text, passwordController.text);
      navigatorKey.currentContext!.read<ProfileViewModel>().userModel =
          UserModel.fromResponse(response.data!);
      storage.setToken(response.jsonBody!['access_token']);
      storage.setRole(response.jsonBody!['role']);
      if (response.statCode == 200 && response.jsonBody!['role'] == 'customer') {
        navigatorKey.currentContext!.goNamed(RoutesName.homeCustomer);
      } else if (response.statCode == 200 && response.jsonBody!['role'] == 'petugas') {
        navigatorKey.currentContext!.goNamed(RoutesName.homeOfficer);
      }
    }
  }
}
