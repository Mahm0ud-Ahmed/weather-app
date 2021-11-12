import 'package:equatable/equatable.dart';
import 'package:weather_app/src/entities/current/location.dart';
import 'package:weather_app/src/entities/current/weather_info.dart';

class CurrentWeather extends Equatable {
  Location? location;
  WeatherInfo? weatherInfo;

  CurrentWeather({this.location, this.weatherInfo});

  @override
  List<Object?> get props => [location, weatherInfo];

  @override
  bool? get stringify => true;
}
