part of 'current_weather_cubit.dart';

@immutable
abstract class CurrentWeatherState {
  CurrentWeather? currentWeather;
  List<ForecastDay>? forecasts;
  APIError? error;

  CurrentWeatherState({this.currentWeather, this.forecasts, this.error});
}

class CurrentWeatherInitial extends CurrentWeatherState {}

class SuccessCurrentWeather extends CurrentWeatherState {
  SuccessCurrentWeather({CurrentWeather? currentWeather})
      : super(currentWeather: currentWeather);
}

class ErrorCurrentWeather extends CurrentWeatherState {
  ErrorCurrentWeather({APIError? error}) : super(error: error);
}

class SuccessForecastsWeather extends CurrentWeatherState {
  SuccessForecastsWeather({List<ForecastDay>? forecasts})
      : super(forecasts: forecasts);
}

class ErrorForecastsWeather extends CurrentWeatherState {
  ErrorForecastsWeather({APIError? error}) : super(error: error);
}
