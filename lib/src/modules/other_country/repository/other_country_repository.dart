import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/api_query/api_query.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/api_error.dart';
import 'package:weather_app/src/data/repositories/main_repository.dart';
import 'package:weather_app/src/modules/favorite/entity/remote/search_country.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast.dart';
import 'package:weather_app/src/modules/home/entity/remote/country_weather.dart';

class OtherCountryRepository {
  final MainRepository? repository;

  OtherCountryRepository({this.repository});

  Future<Either<APIError, CountryWeather>> getOtherCountryWeather(
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

  Future<Either<APIError, Forecast>> getSunInfo(APIQuery param) async {
    return await repository!.getForecast(param)
      ..fold((APIError error) {
        // print(error.message);
        return error;
      }, (Forecast forecast) {
        // print(forecast.forecast!.forecast![0].astro!.sunrise);
        return forecast;
      });
  }
}
