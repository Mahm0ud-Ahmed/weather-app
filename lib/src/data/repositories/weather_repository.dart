import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/params/param.dart';
import 'package:weather_app/src/data/resources/remote/weather_api.dart';
import 'package:weather_app/src/entities/api_error/api_error.dart';
import 'package:weather_app/src/entities/current/current_weather.dart';
import 'package:weather_app/src/entities/forecast/forecast.dart';

class WeatherRepository {
  final WeatherAPI? api;

  WeatherRepository({this.api});

  Future<Either<APIError, CurrentWeather>> getCurrentWeather(
      String path, ParameterAPI param) async {
    return await api!.getCurrentWeather(path, param)
      ..fold((APIError error) {
        // print(error.message);
        return error;
      }, (CurrentWeather weather) {
        // print(weather.location!.country);
        return weather;
      });
  }

  Future<Either<APIError, Forecast>> getForecast(
      String path, ParameterAPI param) async {
    return await api!.getForecast(path, param)
      ..fold((APIError error) {
        // print(error.message);
        return error;
      }, (Forecast forecast) {
        // print(forecast.forecast!.forecast![0].hourInfo![0].condition!.text);
        return forecast;
      });
  }
}
