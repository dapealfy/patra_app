import 'package:app/core/type_defs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dto_post_user_login_response.g.dart';

@JsonSerializable()
class PostUserLoginResponse {
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'nik')
  final String? nik;
  @JsonKey(name: 'role')
  final String? role;

  PostUserLoginResponse({
    this.userId,
    this.name,
    this.email,
    this.nik,
    this.role,
  });

  factory PostUserLoginResponse.fromJson(Json json) => _$PostUserLoginResponseFromJson(json);

  Json toJson() => _$PostUserLoginResponseToJson(this);
}
