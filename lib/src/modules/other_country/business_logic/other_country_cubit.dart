import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/src/core/api_query/api_query.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/api_error.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/astro.dart';
import 'package:weather_app/src/data/resources/local/app_database.dart';
import 'package:weather_app/src/modules/favorite/entity/local/favorite.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast.dart';
import 'package:weather_app/src/modules/home/entity/remote/country_weather.dart';
import 'package:weather_app/src/modules/other_country/repository/other_country_repository.dart';

part 'other_country_state.dart';

class OtherCountryCubit extends Cubit<OtherCountryState> {
  OtherCountryCubit({this.database, this.repository})
      : super(OtherCountryInitial());

  static OtherCountryCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final AppDatabase? database;
  final OtherCountryRepository? repository;

  bool? isFavorite;

  CountryWeather? weather;
  Astro? sunInfo;

  List<Favorite>? favorites;

  currentItemIsFavorite(double lat, double long) async {
    String currentLatLong = lat.toString() + ',' + long.toString();
    if (favorites != null) {
      isFavorite =
          favorites!.any((element) => element.latLong == currentLatLong);
    } else {
      isFavorite = false;
    }
  }

  Future<void> getFavoriteCountry() async {
    favorites = await database!.favoriteDao.getAllFavorite();
  }

  Future<void> saveOrDeleteCountry(Favorite favorite) async {
    isFavorite = !isFavorite!;
    emit(LoadingSaveOrDeleteCountry());
    if (isFavorite!) {
      await saveCountry(favorite);
    } else {
      await deleteCountry(favorite);
    }
    getFavoriteCountry();
  }

  Future<void> saveCountry(Favorite favorite) async {
    bool isAddition =
        favorites!.any((element) => element.latLong == favorite.latLong);
    if (!isAddition) {
      int result =
          await database!.favoriteDao.insertCountryForFavorite(favorite);
      if (result > 0) {
        emit(SuccessSaveCountry());
      } else {
        isFavorite = !isFavorite!;
        emit(ErrorSaveCountry());
      }
    }
  }

  Future<void> deleteCountry(Favorite favorite) async {
    Favorite fav =
        favorites!.firstWhere((element) => element.latLong == favorite.latLong);
    int result = await database!.favoriteDao.deleteCountryFromFavorite(fav);
    if (result > 0) {
      emit(SuccessDeleteCountry());
    } else {
      isFavorite = !isFavorite!;
      emit(ErrorDeleteCountry());
    }
  }

  Future<void> getWeatherDetailsForCountry(double lat, double long) async {
    currentItemIsFavorite(lat, long);
    emit(LoadingCountryDetails());
    try {
      await getOtherCountryWeather(lat, long);
      await getSunInfo(lat, long);
      emit(SuccessCountryDetails());
    } catch (e) {
      print(e.toString());
    }
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
}
