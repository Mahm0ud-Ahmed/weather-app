import 'package:equatable/equatable.dart';

import 'details_country.dart';

class SearchCountry extends Equatable {
  List<DetailsCountry>? details;

  SearchCountry({this.details});

  @override
  List<Object?> get props => [details];

  @override
  bool get stringify => true;
}
