import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/api_error.dart';
import 'package:weather_app/src/core/shared/remote/search_country/entity/details_country.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/data/resources/local/storage_pref.dart';
import 'package:weather_app/src/modules/choose_country/repository/choose_country_repository.dart';

part 'choose_country_state.dart';

class ChooseCountryCubit extends Cubit<ChooseCountryState> {
  ChooseCountryCubit({this.repository}) : super(ChooseCountryInitial());

  static ChooseCountryCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final ChooseCountryRepository? repository;

  List<DetailsCountry>? countries;

  Future<void> getAllCountrySearch(String country) async {
    emit(LoadingCountrySearch());
    final result = await repository!.getAllCountrySearch(country);
    result.fold((error) {
      emit(ErrorCountrySearch(error: error));
    }, (allCountry) {
      countries = allCountry.details;
      emit(SuccessCountrySearch(searchCountries: countries));
    });
  }

  String cutWordFromText(String text) {
    return text.substring(0, text.indexOf(','));
  }

  Future<void> saveMyCountryData(DetailsCountry detailsCountry) async {
    try {
      country =
          detailsCountry.lat.toString() + ',' + detailsCountry.lon.toString();
      locationAddress = detailsCountry.name.toString();
      await StoragePref.setValue('country', country);
      await StoragePref.setValue('location', locationAddress);
      await getDataFromStorage();
      emit(SuccessSaveCountry());
    } on Exception catch (e) {
      print(e.toString());
      emit(ErrorSaveCountry());
    }
  }

  Future<void> getDataFromStorage() async {
    country = await StoragePref.getValue('country');
    locationAddress = await StoragePref.getValue('location');
  }
}
