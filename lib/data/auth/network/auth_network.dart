import 'package:app/core/network/base_network.dart';
import 'package:app/core/response/api_response.dart';
import 'package:app/core/response/json_response.dart';
import 'package:app/data/auth/network/dto_post_user_response.dart';

class AuthNetwork {
  final _network = BaseNetwork.instance;

  static const _userRegister = 'user/register';
  static const _userLogin = 'user/login';

  Future<JsonResponse<PostUserResponse>> postLogin(
    String email,
    String password,
  ) async {
    final request = {
      'email': email,
      'password': password,
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
  ) async {
    final request = {
      'name': name,
      'email': email,
      'nik': nik,
      'password': password,
      'role': 'customer',
    };
    final response = await _network.post(_userRegister,
        body: request, options: _network.baseHeader);

    return ApiResponse.json(response, PostUserResponse.fromJson);
  }
}
