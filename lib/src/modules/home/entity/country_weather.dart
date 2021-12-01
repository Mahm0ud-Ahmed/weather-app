import 'package:equatable/equatable.dart';

import 'location.dart';
import 'weather_info.dart';

class CountryWeather extends Equatable {
  Location? location;
  WeatherInfo? weatherInfo;

  CountryWeather({this.location, this.weatherInfo});

  @override
  List<Object?> get props => [location, weatherInfo];

  @override
  bool? get stringify => true;
}
