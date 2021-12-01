import 'package:weather_app/src/modules/forecast/entity/forecast_day.dart';

import '../../../core/shared/remote/api_error/model/astro_model.dart';
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
