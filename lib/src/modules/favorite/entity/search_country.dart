import 'package:equatable/equatable.dart';
import 'package:weather_app/src/modules/favorite/entity/details_country.dart';

class SearchCountry extends Equatable {
  List<DetailsCountry>? details;

  SearchCountry({this.details});

  @override
  List<Object?> get props => [details];

  @override
  bool get stringify => true;
}
