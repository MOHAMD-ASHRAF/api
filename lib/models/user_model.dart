import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';

class UserModel {
  final String profilePic;
  final String email;
  final String phone;
  final String name;
  final Map<String, dynamic> address;

  UserModel({
    required this.profilePic,
    required this.email,
    required this.phone,
    required this.name,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      profilePic: json['user'][ApiKey.profilePic],
      email: json['user'][ApiKey.email],
      phone: json['user'][ApiKey.phone],
      name: json['user'][ApiKey.name],
      address: json['user'][ApiKey.location],
    );
  }

}