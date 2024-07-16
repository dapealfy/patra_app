import 'package:app/core/response/json_response.dart';
import 'package:app/data/auth/network/auth_network.dart';
import 'package:app/data/auth/network/dto_post_user_response.dart';

class AuthRepository {
  final AuthNetwork _authNetwork;

  AuthRepository(this._authNetwork);

  Future<JsonResponse<PostUserResponse>> registerUser(
    String name,
    String email,
    String nik,
    String password,
  ) async =>
      await _authNetwork.postRegister(
        name,
        email,
        nik,
        password,
      );

  Future<JsonResponse<PostUserResponse>> loginUser(
    String email,
    String password,
  ) async =>
      await _authNetwork.postLogin(
        email,
        password,
      );
}
