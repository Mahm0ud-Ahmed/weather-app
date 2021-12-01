import 'package:dio/dio.dart';
import 'package:weather_app/src/core/api_query/api_query.dart';
import 'package:weather_app/src/core/utils/constant.dart';

class WeatherAPI {
  Dio? _dio;

  WeatherAPI() {
    BaseOptions options = BaseOptions(baseUrl: kBaseUrl);
    _dio = Dio(options);
  }

  Future<Response<dynamic>> callGetAPI(String path, APIQuery param) async {
    Map<String, dynamic> query = {
      'q': param.nameLocation,
      'aqi': param.airQuality,
      'days': param.numberOfDays,
      'alerts': param.weatherAlert,
      'key': param.apiKey,
    };
    query.removeWhere((key, value) => value == null);
    return await _dio!.get(
      path,
      queryParameters: query,
      options: Options(validateStatus: (status) {
        return status! < 500;
      }),
    );
  }
}
