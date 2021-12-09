part of 'other_country_cubit.dart';

@immutable
abstract class OtherCountryState {
  CountryWeather? countryWeather;
  APIError? error;

  OtherCountryState({this.countryWeather, this.error});
}

class OtherCountryInitial extends OtherCountryState {}

class LoadingSaveOrDeleteCountry extends OtherCountryState {}

class SuccessSaveCountry extends OtherCountryState {}

class ErrorSaveCountry extends OtherCountryState {}

class SuccessDeleteCountry extends OtherCountryState {}

class ErrorDeleteCountry extends OtherCountryState {}

class LoadingCountryDetails extends OtherCountryState {}

class SuccessCountryDetails extends OtherCountryState {
  SuccessCountryDetails({CountryWeather? countryWeather})
      : super(countryWeather: countryWeather);
}

class ErrorCountryDetails extends OtherCountryState {
  ErrorCountryDetails({APIError? error}) : super(error: error);
}
