import 'package:flutter/material.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/api_error.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast_day.dart';

@immutable
abstract class ForecastWeatherState {
  List<ForecastDay>? forecasts;
  APIError? error;

  ForecastWeatherState({this.forecasts, this.error});
}

class ForecastWeatherInitial extends ForecastWeatherState {}

class SuccessForecastsWeather extends ForecastWeatherState {
  SuccessForecastsWeather({List<ForecastDay>? forecasts})
      : super(forecasts: forecasts);
}

class ErrorForecastsWeather extends ForecastWeatherState {
  ErrorForecastsWeather({APIError? error}) : super(error: error);
}
