import 'package:weather_app/src/core/shared/remote/search_country/entity/details_country.dart';

class DetailsCountryModel extends DetailsCountry {
  DetailsCountryModel({
    int? id,
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? url,
  }) : super(
            id: id,
            name: name,
            region: region,
            country: country,
            lat: lat,
            lon: lon,
            url: url);

  factory DetailsCountryModel.fromJson(Map<String, dynamic> json) {
    return DetailsCountryModel(
      id: json['id'],
      name: json['name'],
      region: json['region'],
      lat: json['lat'],
      lon: json['lon'],
      country: json['country'],
      url: json['url'],
    );
  }
}
