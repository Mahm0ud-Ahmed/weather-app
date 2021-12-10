import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/api_query/api_query.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/api_error.dart';
import 'package:weather_app/src/data/repositories/main_repository.dart';
import 'package:weather_app/src/data/resources/local/app_database.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast.dart';
import 'package:weather_app/src/modules/home/entity/local/my_country_weather.dart';
import 'package:weather_app/src/modules/home/entity/remote/country_weather.dart';

class WeatherRepository {
  final MainRepository? repository;
  final AppDatabase? database;
  WeatherRepository({this.repository, this.database});

  Future<Either<APIError, CountryWeather>> getCurrentWeather(
      APIQuery param) async {
    return await repository!.getCountryWeather(param)
      ..fold((APIError error) {
        // print(error.message);
        return error;
      }, (CountryWeather weather) {
        // print(weather.location!.country);
        return weather;
      });
  }

  Future<Either<APIError, Forecast>> getForecast(APIQuery param) async {
    return await repository!.getForecast(param)
      ..fold((APIError error) {
        // print(error.message);
        return error;
      }, (Forecast forecast) {
        // print(forecast.forecast!.forecast![0].hourInfo![0].condition!.text);
        return forecast;
      });
  }

  Future<MyCountryWeather?> getDataFromDatabase() async {
    return await database!.myCountryDao.getWeatherForMyCountry();
  }
}
