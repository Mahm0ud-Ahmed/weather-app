import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/api_query/api_query.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/api_error.dart';
import 'package:weather_app/src/data/resources/local/app_database.dart';
import 'package:weather_app/src/modules/favorite/entity/local/favorite.dart';
import 'package:weather_app/src/core/shared/remote/search_country/entity/details_country.dart';
import 'package:weather_app/src/modules/favorite/repository/favorite_repository.dart';
import 'package:weather_app/src/modules/home/entity/remote/country_weather.dart';
import 'favorite_country_state.dart';

class FavoriteCountryCubit extends Cubit<FavoriteCountryState> {
  FavoriteCountryCubit({this.repository, this.database})
      : super(FavoriteCountryInitial());

  static FavoriteCountryCubit get(BuildContext context) =>
      BlocProvider.of(context);

  FavoriteRepository? repository;
  final AppDatabase? database;

  List<DetailsCountry>? countries;

  List<Favorite>? favorite;

  CountryWeather? weather;

  Future<void> getFavoriteCountry() async {
    try {
      final allFavorite = await database!.favoriteDao.getAllFavorite();
      if (favorite == null) {
        favorite = allFavorite;
        emit(SuccessFavoriteCountry(favoriteCountry: allFavorite));
      } else if (allFavorite.length != favorite!.length) {
        favorite = allFavorite;
        emit(SuccessFavoriteCountry(favoriteCountry: allFavorite));
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorFavoriteCountry());
    }
  }

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

  void clearData() {
    countries!.clear();
    emit(ClearSearchList());
  }

  List<double> convertToDouble(String latLong) {
    List<double>? result = [];
    final temp = latLong.split(',');
    for (var element in temp) {
      result.add(double.parse(element));
    }
    return result;
  }

  Future<void> updateCountry(Favorite favorite) async {
    Favorite updateFav = favorite;
    List<double> latAndLong = convertToDouble(favorite.latLong!);
    getOtherCountryWeather(latAndLong.first, latAndLong.last)
        .then((value) async {
      updateFav.date = weather!.location!.localtime!.split(' ').first;
      updateFav.region = weather!.location!.name!;
      updateFav.country = weather!.location!.country!;
      updateFav.latLong = weather!.location!.lat!.toString() +
          ',' +
          weather!.location!.long!.toString();
      updateFav.tempC = weather!.weatherInfo!.tempC!;
      updateFav.tempF = weather!.weatherInfo!.tempF!;
      updateFav.humidity = weather!.weatherInfo!.humidity!;
      updateFav.wind = weather!.weatherInfo!.windKph!;
      updateFav.urlIcon = weather!.weatherInfo!.condition!.icon!;
      await sendDataToDB(updateFav);
    });
  }

  Future<bool> sendDataToDB(Favorite favorite) async {
    bool isSuccess;
    int result = await database!.favoriteDao.updateCountryInFavorite(favorite);
    if (result > 0) {
      isSuccess = true;
      emit(SuccessCountryUpdateDetails());
    } else {
      isSuccess = false;
      emit(ErrorCountryUpdateDetails());
    }
    return isSuccess;
  }

  Future<void> getOtherCountryWeather(double lat, double long) async {
    final result = await repository!
        .getOtherCountryWeather(APIQuery(nameLocation: '$lat,$long'));
    result.fold((APIError error) {
      print(error.message);
      emit(ErrorCountryUpdateDetails(error: error));
    }, (CountryWeather countryWeather) {
      weather = countryWeather;
    });
  }
}
