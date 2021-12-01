import 'package:equatable/equatable.dart';
import 'package:weather_app/src/modules/forecast/entity/forecasts.dart';
import 'package:weather_app/src/modules/home/entity/location.dart';
import 'package:weather_app/src/modules/home/entity/weather_info.dart';

class Forecast extends Equatable {
  Location? locationModel;
  WeatherInfo? currentWeather;
  Forecasts? forecast;

  Forecast({this.locationModel, this.currentWeather, this.forecast});

  @override
  List<Object?> get props => [locationModel, currentWeather, forecast];
}
