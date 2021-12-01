import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/core/api_query/api_query.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/api_error.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast_day.dart';
import 'package:weather_app/src/modules/forecast/repository/forecast_repository.dart';
import 'forecast_weather_state.dart';

class ForecastWeatherCubit extends Cubit<ForecastWeatherState> {
  ForecastWeatherCubit({this.repository}) : super(ForecastWeatherInitial());

  static ForecastWeatherCubit get(BuildContext context) =>
      BlocProvider.of(context);

  ForecastRepository? repository;

  List<ForecastDay>? forecasts;

  Future<void> getForecasts() async {
    if (forecasts == null) {
      final result = await repository!.getForecast(APIQuery(
        nameLocation: 'Egypt',
        numberOfDays: 8,
      ));
      result.fold((APIError error) {
        print(error.message);
        emit(ErrorForecastsWeather(error: error));
      }, (Forecast forecast) {
        forecasts = forecast.forecast!.forecast!.toList();
        // print(_forecasts![0].hourInfo![0].condition!.text);
        emit(SuccessForecastsWeather(forecasts: forecasts));
      });
    }
  }

  String convertDateToDayName(String date) {
    return DateFormat('EEEE').format(DateTime.parse(date));
  }
}
