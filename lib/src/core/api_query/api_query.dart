import 'package:weather_app/src/core/utils/constant.dart';

class APIQuery {
  String? nameLocation;
  String? airQuality;
  String? weatherAlert;
  int? numberOfDays;
  String? apiKey;

  APIQuery(
      {this.nameLocation,
      this.airQuality,
      this.weatherAlert,
      this.numberOfDays,
      this.apiKey = kApiKey});
}
