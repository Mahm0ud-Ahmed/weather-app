import 'package:weather_app/src/data/models/current_model/weather_info_model.dart';
import 'package:weather_app/src/entities/forecast/day_info.dart';

class DayInfoModel extends DayInfo {
  DayInfoModel({
    double? maxTempC,
    double? maxTempF,
    double? minTempC,
    double? minTempF,
    double? avgTempC,
    double? avgTempF,
    double? maxWindMph,
    double? maxWindKph,
    double? totalPrecipMm,
    double? totalPrecipIn,
    double? avgVisKkm,
    double? avgVisMiles,
    double? avgHumidity,
    var dailyWillItRain,
    var dailyChanceOfRain,
    var dailyWillItSnow,
    var dailyChanceOfSnow,
    ConditionModel? conditionModel,
  }) : super(
          maxTempC: maxTempC,
          maxTempF: maxTempF,
          minTempC: minTempC,
          minTempF: minTempF,
          avgTempC: avgTempC,
          avgTempF: avgTempF,
          maxWindMph: maxWindMph,
          maxWindKph: maxWindKph,
          totalPrecipMm: totalPrecipMm,
          totalPrecipIn: totalPrecipIn,
          avgVisKkm: avgVisKkm,
          avgVisMiles: avgVisMiles,
          avgHumidity: avgHumidity,
          dailyWillItRain: dailyWillItRain,
          dailyChanceOfRain: dailyChanceOfRain,
          dailyWillItSnow: dailyWillItSnow,
          dailyChanceOfSnow: dailyChanceOfSnow,
          condition: conditionModel,
        );

  factory DayInfoModel.fromJson(Map<String, dynamic> json) {
    return DayInfoModel(
      maxTempC: json['maxtemp_c'],
      maxTempF: json['maxtemp_f'],
      minTempC: json['mintemp_c'],
      minTempF: json['mintemp_f'],
      avgTempC: json['avgtemp_c'],
      avgTempF: json['avgtemp_f'],
      maxWindMph: json['maxwind_mph'],
      maxWindKph: json['maxwind_kph'],
      totalPrecipMm: json['totalprecip_mm'],
      totalPrecipIn: json['totalprecip_in'],
      avgVisKkm: json['avgvis_km'],
      avgVisMiles: json['avgvis_miles'],
      avgHumidity: json['avghumidity'],
      dailyWillItRain: json['daily_will_it_rain'],
      dailyChanceOfRain: json['daily_chance_of_rain'],
      dailyWillItSnow: json['daily_will_it_snow'],
      dailyChanceOfSnow: json['daily_chance_of_snow'],
      conditionModel: ConditionModel.fromJson(json['condition']),
    );
  }
}
