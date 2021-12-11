import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/api_query/api_query.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/api_error.dart';
import 'package:weather_app/src/core/shared/remote/search_country/entity/search_country.dart';
import 'package:weather_app/src/data/repositories/main_repository.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast.dart';
import 'package:weather_app/src/modules/home/entity/remote/country_weather.dart';

class ChooseCountryRepository {
  final MainRepository? repository;

  ChooseCountryRepository({this.repository});

  Future<Either<APIError, SearchCountry>> getAllCountrySearch(
      String country) async {
    return await repository!.getAllCountrySearch(country)
      ..fold((error) => error, (country) => country);
  }
}
