import 'package:flutter/material.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/api_error.dart';
import 'package:weather_app/src/modules/favorite/entity/details_country.dart';
import 'package:weather_app/src/modules/home/entity/country_weather.dart';

@immutable
abstract class FavoriteCountryState {
  List<DetailsCountry>? countries;
  CountryWeather? countryWeather;
  APIError? error;

  FavoriteCountryState({this.countries, this.countryWeather, this.error});
}

class FavoriteCountryInitial extends FavoriteCountryState {}

class LoadingCountrySearch extends FavoriteCountryState {}

class SuccessCountrySearch extends FavoriteCountryState {
  SuccessCountrySearch({List<DetailsCountry>? countries})
      : super(countries: countries);
}

class ErrorCountrySearch extends FavoriteCountryState {
  ErrorCountrySearch({APIError? error}) : super(error: error);
}

class LoadingCountryDetails extends FavoriteCountryState {}

class SuccessCountryDetails extends FavoriteCountryState {
  SuccessCountryDetails({CountryWeather? countryWeather})
      : super(countryWeather: countryWeather);
}

class ErrorCountryDetails extends FavoriteCountryState {
  ErrorCountryDetails({APIError? error}) : super(error: error);
}
