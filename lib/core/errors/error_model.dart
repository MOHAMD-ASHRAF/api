import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';

class ErrorModel{
  final String status;
  final String errorMessage;
  ErrorModel({required this.status, required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      status: json[ApiKey.status],
      errorMessage: json[ApiKey.errorMessage],
    );
  }
}