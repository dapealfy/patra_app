import 'package:app/data/auth/model/user_model.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  set userModel(UserModel? value) {
    _userModel = value;
    notifyListeners();
  }
}
