import 'package:equatable/equatable.dart';

class WeatherInfo extends Equatable {
  String? lastUpdated;
  double? tempC, tempF;
  int? isDay;
  Condition? condition;
  double? windMph, windKph;
  var windDegree;
  String? windDir;
  double? pressureMb, pressureIn, precipMm, precipIn;
  var humidity;
  var cloud;
  double? feelslikeC, feelslikeF, visKm, visMiles, uv, gustMph, gustKph;

  WeatherInfo(
      {this.lastUpdated,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.visKm,
      this.visMiles,
      this.uv,
      this.gustMph,
      this.gustKph});

  @override
  List<Object?> get props => [
        lastUpdated,
        tempC,
        tempF,
        isDay,
        condition,
        windMph,
        windKph,
        windDegree,
        windDir,
        pressureMb,
        pressureIn,
        precipMm,
        precipIn,
        humidity,
        cloud,
        feelslikeC,
        feelslikeF,
        visKm,
        visMiles,
        uv,
        gustMph,
        gustKph,
      ];

  @override
  bool? get stringify => true;
}

class Condition extends Equatable {
  String? text;
  String? icon;
  int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  @override
  List<Object?> get props => [text, icon, code];

  @override
  bool? get stringify => true;
}
