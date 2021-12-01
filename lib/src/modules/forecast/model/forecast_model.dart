import 'package:weather_app/src/modules/forecast/entity/forecast.dart';
import 'package:weather_app/src/modules/home/model/location_model.dart';
import 'package:weather_app/src/modules/home/model/weather_info_model.dart';

import 'forecasts_model.dart';

class ForecastModel extends Forecast {
  ForecastModel({
    LocationModel? locationModel,
    WeatherInfoModel? currentWeather,
    ForecastsModel? forecast,
  }) : super(
          locationModel: locationModel,
          currentWeather: currentWeather,
          forecast: forecast,
        );

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      locationModel: LocationModel.fromJson(json['location']),
      currentWeather: WeatherInfoModel.fromJson(json['current']),
      forecast: ForecastsModel.fromJson(json['forecast']),
    );
  }
}
