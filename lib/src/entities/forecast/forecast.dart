import 'package:equatable/equatable.dart';
import 'package:weather_app/src/data/models/current_model/location_model.dart';
import 'package:weather_app/src/data/models/current_model/weather_info_model.dart';
import 'package:weather_app/src/data/models/forecast_model/forecasts_model.dart';

class Forecast extends Equatable {
  LocationModel? locationModel;
  WeatherInfoModel? currentWeather;
  ForecastsModel? forecast;

  Forecast({this.locationModel, this.currentWeather, this.forecast});

  @override
  List<Object?> get props => [locationModel, currentWeather, forecast];
}
