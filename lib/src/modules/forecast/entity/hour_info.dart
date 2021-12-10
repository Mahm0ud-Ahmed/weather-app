import 'package:equatable/equatable.dart';
import 'package:weather_app/src/modules/home/entity/remote/weather_info.dart';

class HourInfo extends WeatherInfo with EquatableMixin {
  double? windChillC;
  double? windChillF;
  double? heatIndexC;
  double? heatIndexF;
  double? dewPointC;
  double? dewPointF;
  var willItRain, chanceOfRain;
  var willItSnow, chanceOfSnow;

  HourInfo({
    this.windChillC,
    this.windChillF,
    this.heatIndexC,
    this.heatIndexF,
    this.dewPointC,
    this.dewPointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    String? time,
    double? tempC,
    double? tempF,
    int? isDay,
    Condition? condition,
    double? windMph,
    double? windKph,
    var degree,
    String? windDir,
    double? pressureMb,
    double? pressureIn,
    double? precipMm,
    double? precipIn,
    var humidity,
    var cloud,
    double? feelsLikeC,
    double? feelsLikeF,
    double? visKm,
    double? visMiles,
    double? gustMph,
    double? gustKph,
    double? uv,
  }) : super(
          time: time,
          tempC: tempC,
          tempF: tempF,
          isDay: isDay,
          condition: condition,
          windMph: windMph,
          windKph: windKph,
          windDegree: degree,
          windDir: windDir,
          pressureMb: pressureMb,
          pressureIn: pressureIn,
          precipMm: precipMm,
          precipIn: pressureIn,
          humidity: humidity,
          cloud: cloud,
          feelslikeC: feelsLikeC,
          feelslikeF: feelsLikeF,
          visKm: visKm,
          visMiles: visMiles,
          gustMph: gustMph,
          gustKph: gustKph,
          uv: uv,
        );

  @override
  List<Object?> get props => [
        windChillC,
        windChillF,
        heatIndexC,
        heatIndexF,
        dewPointC,
        dewPointF,
        willItRain,
        chanceOfRain,
        willItSnow,
        chanceOfSnow,
      ];

  @override
  bool get stringify => true;
}
