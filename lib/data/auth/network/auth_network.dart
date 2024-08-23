import 'package:app/core/network/base_network.dart';
import 'package:app/core/response/api_response.dart';
import 'package:app/core/response/json_response.dart';
import 'package:app/data/auth/network/dto_post_user_response.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthNetwork {
  final _network = BaseNetwork.instance;

  static const _userRegister = 'public/api/register';
  static const _userLogin = 'api/login';

  Future<JsonResponse<PostUserResponse>> postLogin(
    String email,
    String password,
  ) async {
    String fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
    final request = {
      'email': email,
      'password': password,
      'fcm_token': fcmToken,
    };
    final response = await _network.post(_userLogin,
        body: request, options: _network.baseHeader);

    return ApiResponse.json(response, PostUserResponse.fromJson);
  }

  Future<JsonResponse<PostUserResponse>> postRegister(
    String name,
    String email,
    String nik,
    String password,
    String alamatRumah,
    String noTelp,
    String role,
  ) async {
    final request = {
      'name': name,
      'email': email,
      'nik': nik,
      'password': password,
      'alamat_rumah': alamatRumah,
      'no_telp': noTelp,
      'role': role,
    };
    final response = await _network.post(_userRegister,
        body: request, options: _network.baseHeader);

    return ApiResponse.json(response, PostUserResponse.fromJson);
  }
}
