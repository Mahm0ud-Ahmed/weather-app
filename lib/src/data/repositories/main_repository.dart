import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/api_query/api_query.dart';
import 'package:weather_app/src/core/shared/remote/api_error/model/api_error_model.dart';
import 'package:weather_app/src/core/shared/remote/search_country/model/search_country_model.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/data/resources/remote/weather_api.dart';
import 'package:weather_app/src/modules/forecast/model/forecast_model.dart';
import 'package:weather_app/src/modules/home/model/country_weather_model.dart';

class MainRepository {
  final WeatherAPI? api;

  MainRepository({this.api});

  Future<Either<APIErrorModel, CountryWeatherModel>> getCountryWeather(
      APIQuery param) async {
    final response = await api!.callGetAPI(kWeatherMyCountry, param);
    try {
      return Right(CountryWeatherModel.fromJson(response.data!));
    } catch (error) {
      return Left(APIErrorModel.fromJson(response.data!['error']));
    }
  }

  Future<Either<APIErrorModel, ForecastModel>> getForecast(
      APIQuery param) async {
    final response = await api!.callGetAPI(kForecast, param);
    try {
      return Right(ForecastModel.fromJson(response.data!));
    } catch (error) {
      return Left(APIErrorModel.fromJson(response.data!['error']));
    }
  }

  Future<Either<APIErrorModel, SearchCountryModel>> getAllCountrySearch(
      String country) async {
    final response = await api!
        .callGetAPI(kSearchOfCountry, APIQuery(nameLocation: country));
    try {
      return Right(SearchCountryModel.fromJson(response.data));
    } catch (error) {
      return Left(APIErrorModel.fromJson(response.data!['error']));
    }
  }
}
