import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/api_query/api_query.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/api_error.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/astro.dart';
import 'package:weather_app/src/modules/favorite/entity/details_country.dart';
import 'package:weather_app/src/modules/favorite/repository/favorite_repository.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast.dart';
import 'package:weather_app/src/modules/home/entity/country_weather.dart';
import 'favorite_country_state.dart';

class FavoriteCountryCubit extends Cubit<FavoriteCountryState> {
  FavoriteCountryCubit({this.repository}) : super(FavoriteCountryInitial());

  static FavoriteCountryCubit get(BuildContext context) =>
      BlocProvider.of(context);

  FavoriteRepository? repository;

  List<DetailsCountry>? countries;
  CountryWeather? weather;

  Astro? sunInfo;

  Future<void> getAllCountrySearch(String country) async {
    emit(LoadingCountrySearch());
    final result = await repository!.getAllCountrySearch(country);
    result.fold((error) {
      emit(ErrorCountrySearch(error: error));
    }, (allCountry) {
      countries = allCountry.details;
      emit(SuccessCountrySearch(countries: countries));
    });
  }

  String cutWordFromText(String text) {
    return text.substring(0, text.indexOf(','));
  }

  Future<void> getOtherCountryWeather(double lat, double long) async {
    final result = await repository!
        .getOtherCountryWeather(APIQuery(nameLocation: '$lat,$long'));
    result.fold((APIError error) {
      print(error.message);
      emit(ErrorCountryDetails(error: error));
    }, (CountryWeather countryWeather) {
      weather = countryWeather;
    });
  }

  Future<void> getSunInfo(double lat, double long) async {
    final result =
        await repository!.getSunInfo(APIQuery(nameLocation: '$lat,$long'));
    result.fold((APIError error) {
      print(error.message);
      emit(ErrorCountryDetails(error: error));
    }, (Forecast forecast) {
      sunInfo = forecast.forecast!.forecast![0].astro;
    });
  }

  void clearData() {
    countries!.clear();
  }

  Future<void> getAllData(double lat, double long) async {
    emit(LoadingCountryDetails());
    await getOtherCountryWeather(lat, long);
    await getSunInfo(lat, long);
    clearData();
    emit(SuccessCountryDetails());
  }
}
