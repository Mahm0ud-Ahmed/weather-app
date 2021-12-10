import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/data/resources/local/storage_pref.dart';

part 'setting_weather_state.dart';

class SettingWeatherCubit extends Cubit<SettingWeatherState> {
  SettingWeatherCubit() : super(SettingWeatherInitial());

  static SettingWeatherCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> changeTempSettingWeather(String newValue) async {
    temperature = newValue;
    await StoragePref.setValue('temp', newValue);
    emit(ChangeTempSettingWeather());
  }

  Future<void> changeWindSettingWeather(String newValue) async {
    wind = newValue;
    await StoragePref.setValue('wind', newValue);
    emit(ChangeWindSettingWeather());
  }
}
