import 'package:weather_app/src/core/shared/remote/api_error/entity/api_error.dart';

class APIErrorModel extends APIError {
  APIErrorModel({String? message, int? code})
      : super(message: message, code: code);

  factory APIErrorModel.fromJson(Map<String, dynamic> json) {
    return APIErrorModel(
      message: json['message'],
      code: json['code'],
    );
  }
}
