import 'package:weather_app/src/entities/forecast/astro.dart';
import 'package:weather_app/src/entities/forecast/day_info.dart';
import 'package:weather_app/src/entities/forecast/forecast_day.dart';
import 'package:weather_app/src/entities/forecast/hour_info.dart';
import 'astro_model.dart';
import 'day_info_model.dart';
import 'hour_info_model.dart';

class ForecastDayModel extends ForecastDay {
  ForecastDayModel({
    String? date,
    DayInfoModel? dayInfo,
    AstroModel? astro,
    List<HourInfoModel>? hourInfo,
  }) : super(
          date: date,
          dayInfo: dayInfo,
          astro: astro,
          hourInfo: hourInfo,
        );

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    return ForecastDayModel(
      date: json['date'],
      dayInfo: DayInfoModel.fromJson(json['day']),
      astro: AstroModel.fromJson(json['astro']),
      hourInfo: List<HourInfoModel>.from(
        (json['hour'] as List<dynamic>)
            .map((info) => HourInfoModel.fromJson(info)),
      ),
    );
  }
}
