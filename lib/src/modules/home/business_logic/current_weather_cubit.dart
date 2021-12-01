import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/api_query/api_query.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/api_error.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast_day.dart';
import 'package:weather_app/src/modules/forecast/entity/hour_info.dart';
import 'package:weather_app/src/modules/home/entity/country_weather.dart';
import 'package:weather_app/src/modules/home/repository/weather_repository.dart';

import 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  CurrentWeatherCubit({this.repository}) : super(CurrentWeatherInitial());

  static CurrentWeatherCubit get(BuildContext context) =>
      BlocProvider.of(context);

  WeatherRepository? repository;

  CountryWeather? weather;
  List<ForecastDay>? forecasts;

  List<HourInfo>? hoursInfo = [];

  Future<void> getCurrentWeather(APIQuery param) async {
    if (weather == null) {
      final result = await repository!.getCurrentWeather(param);
      result.fold((APIError error) {
        print(error.message);
        emit(ErrorCurrentWeather(error: error));
      }, (CountryWeather currentWeather) {
        weather = currentWeather;
        // print(_currentWeather!.location!.country);
        emit(SuccessCurrentWeather(currentWeather: weather));
      });
    }
  }

  Future<void> getForecasts(APIQuery param) async {
    if (forecasts == null) {
      final result = await repository!.getForecast(param);
      result.fold((APIError error) {
        print(error.message);
        emit(ErrorForecastsWeather(error: error));
      }, (Forecast forecast) {
        forecasts = forecast.forecast!.forecast!.toList();
        additionRemainingHours(forecasts![0].hourInfo!);
        // print(_forecasts![0].hourInfo![0].condition!.text);
        emit(SuccessForecastsWeather(forecasts: forecasts));
      });
    }
  }

  void additionRemainingHours(List<HourInfo> allHours) {
    int time = TimeOfDay.now().hour;
    if (hoursInfo!.isEmpty) {
      for (var hour in allHours) {
        int hourWeather = extractHourAndParsed(hour.time!);
        if (time <= hourWeather) {
          hoursInfo!.add(hour);
        }
      }
    }
  }

  int extractHourAndParsed(String time) {
    String myHour = time.substring(time.indexOf(' ') + 1).split(':').first;
    return int.parse(myHour);
  }
}
