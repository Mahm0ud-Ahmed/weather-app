import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/src/core/params/param.dart';
import 'package:weather_app/src/data/repositories/weather_repository.dart';
import 'package:weather_app/src/entities/api_error/api_error.dart';
import 'package:weather_app/src/entities/current/current_weather.dart';
import 'package:weather_app/src/entities/forecast/forecast.dart';
import 'package:weather_app/src/entities/forecast/forecast_day.dart';

part 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  CurrentWeatherCubit({this.repository}) : super(CurrentWeatherInitial());

  static CurrentWeatherCubit get(BuildContext context) =>
      BlocProvider.of(context);

  WeatherRepository? repository;

  CurrentWeather? _currentWeather;
  List<ForecastDay>? _forecasts;

  Future<void> getCurrentWeather(String path, ParameterAPI param) async {
    final result = await repository!.getCurrentWeather(path, param);
    result.fold((APIError error) {
      print(error.message);
      emit(ErrorCurrentWeather(error: error));
    }, (CurrentWeather currentWeather) {
      _currentWeather = currentWeather;
      print(_currentWeather!.location!.country);
      emit(SuccessCurrentWeather(currentWeather: _currentWeather));
    });
  }

  Future<void> getForecasts(String path, ParameterAPI param) async {
    final result = await repository!.getForecast(path, param);
    result.fold((APIError error) {
      print(error.message);
      emit(ErrorForecastsWeather(error: error));
    }, (Forecast forecast) {
      _forecasts = forecast.forecast!.forecast!.toList();
      print(_forecasts![0].hourInfo![0].condition!.text);
      emit(SuccessForecastsWeather(forecasts: _forecasts));
    });
  }
}
