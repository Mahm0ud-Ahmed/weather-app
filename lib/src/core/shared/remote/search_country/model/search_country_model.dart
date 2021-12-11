import 'package:weather_app/src/core/shared/remote/search_country/entity/details_country.dart';
import 'package:weather_app/src/core/shared/remote/search_country/entity/search_country.dart';

import 'details_country_model.dart';

class SearchCountryModel extends SearchCountry {
  SearchCountryModel({List<DetailsCountry>? details}) : super(details: details);

  factory SearchCountryModel.fromJson(List<dynamic> json) {
    return SearchCountryModel(
      details: List<DetailsCountry>.from(
        (json).map(
          (detailsCountry) => DetailsCountryModel.fromJson(detailsCountry),
        ),
      ),
    );
  }
}
