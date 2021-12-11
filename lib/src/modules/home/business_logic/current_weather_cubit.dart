import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/api_query/api_query.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/api_error.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/data/resources/local/app_database.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast_day.dart';
import 'package:weather_app/src/modules/forecast/entity/hour_info.dart';
import 'package:weather_app/src/modules/home/entity/local/my_country_weather.dart';
import 'package:weather_app/src/modules/home/entity/remote/country_weather.dart';
import 'package:weather_app/src/modules/home/repository/weather_repository.dart';

import 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  CurrentWeatherCubit({this.repository, this.database})
      : super(CurrentWeatherInitial());

  static CurrentWeatherCubit get(BuildContext context) =>
      BlocProvider.of(context);

  WeatherRepository? repository;
  AppDatabase? database;

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
        // emit(SuccessCurrentWeather(currentWeather: weather));
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
        // emit(SuccessForecastsWeather(forecasts: forecasts));
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

  Future<void> getWeatherForCountry() async {
    await getDataFromDatabase();
    if (hasConnection) {
      if (myCountryWeatherDB != null) {
        await database!.myCountryDao.deleteAllData();
      }
      if (weather == null || forecasts == null) {
        await getCurrentWeather(APIQuery(nameLocation: country));
        await getForecasts(APIQuery(nameLocation: country));
        if (weather != null || forecasts != null) {
          int result = await insertDataInDatabase();
          if (result > 0) {
            emit(SuccessCurrentWeather(
                currentWeather: weather, forecasts: forecasts));
          }
        }
      }
    } else {
      emit(SuccessCurrentWeatherDatabase(
          myCountryWeatherDB: myCountryWeatherDB));
    }
  }

  Future<int> insertDataInDatabase() async {
    return await database!.myCountryDao.insertDataMyWeather(MyCountryWeather(
      date: weather!.location!.localtime,
      tempC: weather!.weatherInfo!.tempC,
      tempF: weather!.weatherInfo!.tempF,
      urlIcon: weather!.weatherInfo!.condition!.icon,
      sunState: weather!.weatherInfo!.condition!.text,
      location: weather!.location!.name.toString() +
          weather!.location!.country.toString(),
      humidity: weather!.weatherInfo!.humidity,
      cloud: weather!.weatherInfo!.cloud,
      windK: weather!.weatherInfo!.windKph,
      windM: weather!.weatherInfo!.windMph,
      sunrise: forecasts![0].astro!.sunrise,
      sunset: forecasts![0].astro!.sunset,
    ));
  }

  Future<MyCountryWeather?> getDataFromDatabase() async {
    return myCountryWeatherDB = await repository!.getDataFromDatabase();
  }
}
