import 'package:app/data/auth/model/user_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  String fcmToken = '';

  set userModel(UserModel? value) {
    _userModel = value;
    notifyListeners();
  }

  void initialize() async{
    fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
    print(fcmToken);
    notifyListeners();
  }
}
