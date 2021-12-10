import 'package:weather_app/src/modules/home/entity/remote/country_weather.dart';
import 'package:weather_app/src/modules/home/model/weather_info_model.dart';

import 'location_model.dart';

class CountryWeatherModel extends CountryWeather {
  CountryWeatherModel({
    LocationModel? location,
    WeatherInfoModel? weatherInfo,
  }) : super(location: location, weatherInfo: weatherInfo);

  factory CountryWeatherModel.fromJson(Map<String, dynamic> json) {
    return CountryWeatherModel(
      location: LocationModel.fromJson(json['location']),
      weatherInfo: WeatherInfoModel.fromJson(json['current']),
    );
  }
}
