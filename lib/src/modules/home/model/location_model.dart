import 'package:weather_app/src/modules/home/entity/remote/location.dart';

class LocationModel extends Location {
  LocationModel({
    String? name,
    String? region,
    String? country,
    double? lat,
    double? long,
    String? tzId,
    String? localtime,
  }) : super(
          name: name,
          region: region,
          country: country,
          lat: lat,
          long: long,
          tzId: tzId,
          localtime: localtime,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        name: json['name'],
        region: json['region'],
        country: json['country'],
        lat: json['lat'],
        long: json['lon'],
        tzId: json['tz_id'],
        localtime: json['localtime']);
  }
}
