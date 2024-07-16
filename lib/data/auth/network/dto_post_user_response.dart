import 'package:app/core/type_defs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dto_post_user_response.g.dart';

@JsonSerializable()
class PostUserResponse {
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'nik')
  final String? nik;
  @JsonKey(name: 'role')
  final String? role;

  PostUserResponse({
    this.userId,
    this.name,
    this.email,
    this.nik,
    this.role,
  });

  factory PostUserResponse.fromJson(Json json) => _$PostUserResponseFromJson(json);

  Json toJson() => _$PostUserResponseToJson(this);
}
