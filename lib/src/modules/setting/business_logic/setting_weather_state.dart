part of 'setting_weather_cubit.dart';

@immutable
abstract class SettingWeatherState {}

class SettingWeatherInitial extends SettingWeatherState {}

class ChangeTempSettingWeather extends SettingWeatherState {}

class ChangeWindSettingWeather extends SettingWeatherState {}
