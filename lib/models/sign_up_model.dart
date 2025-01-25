import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';

class SignUpModel {
    final String message;

    SignUpModel({
        required this.message,
    });

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        message: json[ApiKey.message],
    );
}