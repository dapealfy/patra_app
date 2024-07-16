

import 'package:app/data/auth/network/dto_post_user_response.dart';

/// User Profile rich object model, contains sensible default value.
/// for DTO, look at [PostUserRegisterResponse]
class UserModel {
  final int userId;
  final String name;
  final String email;
  final String nik;
  final String role;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.nik,
    required this.role,
  });

  factory UserModel.fromResponse(PostUserResponse response) {
    return UserModel(
      userId: response.userId ?? -1,
      email: response.email ?? '',
      name: response.name ?? '',
      nik: response.nik ?? '',
      role: response.role ?? '',
    );
  }

  PostUserResponse toResponse() {
    return PostUserResponse(
      userId: userId,
      email: email,
      name: name,
      nik: nik,
      role: role,
    );
  }

  UserModel copyWith({
    int? userId,
    String? email,
    String? name,
    String? nik,
    String? role,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      nik: nik ?? this.nik,
      role: role ?? this.role,
    );
  }
}

enum UserRole { customer, petugas }
