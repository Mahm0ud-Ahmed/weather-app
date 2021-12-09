import 'package:flutter/material.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/api_error.dart';
import 'package:weather_app/src/modules/favorite/entity/local/favorite.dart';
import 'package:weather_app/src/modules/favorite/entity/remote/details_country.dart';

@immutable
abstract class FavoriteCountryState {
  List<DetailsCountry>? countries;
  List<Favorite>? favorite;
  APIError? error;

  FavoriteCountryState({this.countries, this.favorite, this.error});
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

class LoadingFavoriteCountry extends FavoriteCountryState {}

class SuccessFavoriteCountry extends FavoriteCountryState {
  SuccessFavoriteCountry({List<Favorite>? favoriteCountry})
      : super(favorite: favoriteCountry);
}

class ErrorFavoriteCountry extends FavoriteCountryState {}

class ErrorCountryUpdateDetails extends FavoriteCountryState {
  ErrorCountryUpdateDetails({APIError? error}) : super(error: error);
}

class ClearSearchList extends FavoriteCountryState {}
