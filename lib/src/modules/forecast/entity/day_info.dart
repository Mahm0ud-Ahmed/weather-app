import 'package:equatable/equatable.dart';
import 'package:weather_app/src/modules/home/entity/weather_info.dart';

class DayInfo extends Equatable {
  double? maxTempC, maxTempF;
  double? minTempC, minTempF;
  double? avgTempC, avgTempF;
  double? maxWindMph, maxWindKph;
  double? totalPrecipMm, totalPrecipIn;
  double? avgVisKkm;
  double? avgVisMiles, avgHumidity;
  var dailyWillItRain, dailyChanceOfRain;
  var dailyWillItSnow, dailyChanceOfSnow;
  Condition? condition;

  DayInfo(
      {this.maxTempC,
      this.maxTempF,
      this.minTempC,
      this.minTempF,
      this.avgTempC,
      this.avgTempF,
      this.maxWindMph,
      this.maxWindKph,
      this.totalPrecipMm,
      this.totalPrecipIn,
      this.avgVisKkm,
      this.avgVisMiles,
      this.avgHumidity,
      this.dailyWillItRain,
      this.dailyChanceOfRain,
      this.dailyWillItSnow,
      this.dailyChanceOfSnow,
      this.condition});

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        maxTempC,
        maxTempF,
        minTempC,
        minTempF,
        avgTempC,
        avgTempF,
        maxWindMph,
        maxWindKph,
        totalPrecipMm,
        totalPrecipIn,
        avgVisKkm,
        avgVisMiles,
        avgHumidity,
        dailyWillItRain,
        dailyChanceOfRain,
        dailyWillItSnow,
        dailyChanceOfSnow,
        condition
      ];
}
