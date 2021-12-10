import 'package:equatable/equatable.dart';

class Location extends Equatable {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? long;
  String? tzId;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.long,
    this.tzId,
    this.localtime,
  });

  @override
  List<Object?> get props =>
      [name, region, country, lat, long, tzId, localtime];

  @override
  bool? get stringify => true;
}
