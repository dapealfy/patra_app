import 'package:app/core/router/routes_name.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterViewModel extends ChangeNotifier {
  // late final AuthRepository _authRepository = serviceLocator.get();

  TextEditingController nameController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }

  void register() async {
    bool isEmailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    if (emailController.text.isNotEmpty &&
        isEmailValid &&
        passwordController.text.length >= 8) {
      // final response = await _authRepository.loginUser(
      //     emailController.text, passwordController.text);
      // navigatorKey.currentContext!.read<ProfileViewModel>().userModel =
      //     UserModel.fromResponse(response.data!);
      // navigatorKey.currentContext!.pushNamed(RoutesName.home);
    }
    navigatorKey.currentContext!.goNamed(RoutesName.homeCustomer);
  }
}
