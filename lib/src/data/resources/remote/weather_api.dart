import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/src/core/params/param.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/data/models/current_model/current_weather_model.dart';
import 'package:weather_app/src/data/models/error_model/api_error_model.dart';
import 'package:weather_app/src/data/models/forecast_model/forecast_model.dart';

class WeatherAPI {
  Dio? _dio;

  WeatherAPI() {
    BaseOptions options = BaseOptions(baseUrl: kBaseUrl);
    _dio = Dio(options);
  }

  Future<Response<Map<String, dynamic>>> _callGetAPI(
      String path, ParameterAPI param) async {
    Map<String, dynamic> query = {
      'q': param.nameLocation,
      'aqi': param.airQuality ?? 'no',
      'days': param.numberOfDays ?? 1,
      'alerts': param.weatherAlert ?? 'no',
      'key': param.apiKey,
    };
    return await _dio!.get<Map<String, dynamic>>(
      path,
      queryParameters: query,
      options: Options(validateStatus: (status) {
        return status! < 500;
      }),
    );
  }

  Future<Either<APIErrorModel, CurrentWeatherModel>> getCurrentWeather(
      String path, ParameterAPI param) async {
    final response = await _callGetAPI(path, param);
    try {
      return Right(CurrentWeatherModel.fromJson(response.data!));
    } catch (error) {
      return Left(APIErrorModel.fromJson(response.data!['error']));
    }
  }

  Future<Either<APIErrorModel, ForecastModel>> getForecast(
      String path, ParameterAPI param) async {
    final response = await _callGetAPI(path, param);
    try {
      return Right(ForecastModel.fromJson(response.data!));
    } catch (error) {
      return Left(APIErrorModel.fromJson(response.data!['error']));
    }
  }
}
