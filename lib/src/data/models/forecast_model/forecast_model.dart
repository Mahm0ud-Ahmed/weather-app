import 'package:weather_app/src/data/models/current_model/location_model.dart';
import 'package:weather_app/src/data/models/current_model/weather_info_model.dart';
import 'package:weather_app/src/data/models/forecast_model/forecasts_model.dart';
import 'package:weather_app/src/entities/forecast/forecast.dart';

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
