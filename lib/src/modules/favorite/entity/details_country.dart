import 'package:equatable/equatable.dart';

class DetailsCountry extends Equatable {
  int? id;
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? url;

  DetailsCountry(
      {this.id,
      this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.url});

  @override
  List<Object?> get props => [id, name, region, country, lat, lon, url];

  @override
  bool get stringify => true;
}
