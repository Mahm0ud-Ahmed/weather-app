import 'package:flutter/material.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/api_error.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast_day.dart';
import 'package:weather_app/src/modules/home/entity/local/my_country_weather.dart';
import 'package:weather_app/src/modules/home/entity/remote/country_weather.dart';

@immutable
abstract class CurrentWeatherState {
  CountryWeather? currentWeather;
  MyCountryWeather? myCountryWeatherDB;
  List<ForecastDay>? forecasts;
  APIError? error;

  CurrentWeatherState(
      {this.currentWeather,
      this.forecasts,
      this.myCountryWeatherDB,
      this.error});
}

class CurrentWeatherInitial extends CurrentWeatherState {}

class SuccessCurrentWeather extends CurrentWeatherState {
  SuccessCurrentWeather(
      {CountryWeather? currentWeather, List<ForecastDay>? forecasts})
      : super(currentWeather: currentWeather, forecasts: forecasts);
}

class SuccessCurrentWeatherDatabase extends CurrentWeatherState {
  SuccessCurrentWeatherDatabase({MyCountryWeather? myCountryWeatherDB})
      : super(myCountryWeatherDB: myCountryWeatherDB);
}

class ErrorCurrentWeather extends CurrentWeatherState {
  ErrorCurrentWeather({APIError? error}) : super(error: error);
}

class SuccessForecastsWeather extends CurrentWeatherState {
  SuccessForecastsWeather({List<ForecastDay>? forecasts})
      : super(forecasts: forecasts);
}

class ErrorForecastsWeather extends CurrentWeatherState {
  ErrorForecastsWeather({APIError? error}) : super(error: error);
}
