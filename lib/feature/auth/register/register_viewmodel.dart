import 'package:app/core/di/service_locator.dart';
import 'package:app/core/router/routes_name.dart';
import 'package:app/data/auth/model/user_model.dart';
import 'package:app/data/auth/repository/auth_repository.dart';
import 'package:app/feature/profile/profile_viewmodel.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterViewModel extends ChangeNotifier {
  late final AuthRepository _authRepository = serviceLocator.get();

  TextEditingController nameController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController alamatRumahController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();

  String _role = 'customer';
  String get role => _role;

  set role(String value) {
    _role = value;
    notifyListeners();
  }

  bool _obscureText = true;
  bool get obscureText => _obscureText;

  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void register() async {
    bool isEmailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    if (emailController.text.isNotEmpty &&
        isEmailValid &&
        passwordController.text.length >= 8 &&
        passwordController.text == confirmPasswordController.text) {
      isLoading = true;
      final response = await _authRepository.registerUser(
          nameController.text,
          emailController.text,
          nikController.text,
          passwordController.text,
          alamatRumahController.text,
          noTelpController.text,
          role);
      navigatorKey.currentContext!.read<ProfileViewModel>().userModel =
          UserModel.fromResponse(response.data!);
      isLoading = false;
      if (response.statCode == 200) {
        navigatorKey.currentContext!.goNamed(RoutesName.login);
      }
    } else {
      if (!emailController.text.isNotEmpty) {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(
            content: Text(
              'Email Masih Kosong',
            ),
          ),
        );
      } else if (!isEmailValid) {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(
            content: Text(
              'Format Email Salah',
            ),
          ),
        );
      } else if (passwordController.text.length < 8) {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(
            content: Text(
              'Password Kurang dari 8 karakter',
            ),
          ),
        );
      } else if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(
            content: Text(
              'Password Tidak Sama',
            ),
          ),
        );
      }
    }
  }
}
