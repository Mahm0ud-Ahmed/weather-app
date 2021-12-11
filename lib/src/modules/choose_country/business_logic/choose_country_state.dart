part of 'choose_country_cubit.dart';

@immutable
abstract class ChooseCountryState {
  List<DetailsCountry>? searchCountry;
  APIError? error;

  ChooseCountryState({this.searchCountry, this.error});
}

class ChooseCountryInitial extends ChooseCountryState {}

class LoadingCountrySearch extends ChooseCountryState {}

class SuccessCountrySearch extends ChooseCountryState {
  SuccessCountrySearch({List<DetailsCountry>? searchCountries})
      : super(searchCountry: searchCountries);
}

class ErrorCountrySearch extends ChooseCountryState {
  ErrorCountrySearch({APIError? error}) : super(error: error);
}

class SuccessSaveCountry extends ChooseCountryState {}

class ErrorSaveCountry extends ChooseCountryState {}
