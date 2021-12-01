import 'package:weather_app/src/modules/forecast/entity/forecasts.dart';

import 'forecast_day_model.dart';

class ForecastsModel extends Forecasts {
  ForecastsModel({List<ForecastDayModel>? forecast})
      : super(forecast: forecast);

  factory ForecastsModel.fromJson(Map<String, dynamic> json) {
    return ForecastsModel(
      forecast: List<ForecastDayModel>.from(
        (json['forecastday'] as List<dynamic>).map(
          (forecast) => ForecastDayModel.fromJson(forecast),
        ),
      ),
    );
  }
}
