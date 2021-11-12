import 'package:weather_app/src/data/models/current_model/weather_info_model.dart';
import 'package:weather_app/src/entities/current/current_weather.dart';

import 'location_model.dart';

class CurrentWeatherModel extends CurrentWeather {
  CurrentWeatherModel({
    LocationModel? location,
    WeatherInfoModel? weatherInfo,
  }) : super(location: location, weatherInfo: weatherInfo);

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      location: LocationModel.fromJson(json['location']),
      weatherInfo: WeatherInfoModel.fromJson(json['current']),
    );
  }
}
