import 'package:weather_app/src/modules/home/entity/weather_info.dart';

class WeatherInfoModel extends WeatherInfo {
  WeatherInfoModel({
    String? time,
    double? tempC,
    double? tempF,
    int? isDay,
    ConditionModel? conditionModel,
    double? windMph,
    double? windKph,
    var windDegree,
    String? windDir,
    double? pressureMb,
    double? pressureIn,
    double? precipMm,
    double? precipIn,
    var humidity,
    var cloud,
    double? feelslikeC,
    double? feelslikeF,
    double? visKm,
    double? visMiles,
    double? uv,
    double? gustMph,
    double? gustKph,
  }) : super(
          time: time,
          tempC: tempC,
          tempF: tempF,
          isDay: isDay,
          condition: conditionModel,
          windMph: windMph,
          windKph: windKph,
          windDegree: windDegree,
          windDir: windDir,
          pressureMb: pressureMb,
          pressureIn: pressureIn,
          precipMm: precipMm,
          precipIn: precipIn,
          humidity: humidity,
          cloud: cloud,
          feelslikeC: feelslikeC,
          feelslikeF: feelslikeF,
          visKm: visKm,
          visMiles: visMiles,
          uv: uv,
          gustMph: gustMph,
          gustKph: gustKph,
        );

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) {
    return WeatherInfoModel(
      time: json['last_updated'],
      tempC: json['temp_c'],
      tempF: json['temp_f'],
      isDay: json['is_day'],
      conditionModel: ConditionModel.fromJson(json['condition']),
      windMph: json['wind_mph'],
      windKph: json['wind_kph'],
      windDegree: json['wind_degree'],
      windDir: json['wind_dir'],
      pressureMb: json['pressure_mb'],
      pressureIn: json['pressure_in'],
      precipMm: json['precip_mm'],
      precipIn: json['precip_in'],
      humidity: json['humidity'],
      cloud: json['cloud'],
      feelslikeC: json['feelslike_c'],
      feelslikeF: json['feelslike_f'],
      visKm: json['vis_km'],
      visMiles: json['vis_miles'],
      uv: json['uv'],
      gustMph: json['gust_mph'],
      gustKph: json['gust_kph'],
    );
  }
}

class ConditionModel extends Condition {
  ConditionModel({
    String? text,
    String? icon,
    int? code,
  }) : super(
          text: text,
          icon: icon,
          code: code,
        );

  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return ConditionModel(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
}
