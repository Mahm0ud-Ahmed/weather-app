import 'package:weather_app/src/core/utils/constant.dart';

class APIQuery {
  final String? nameLocation;
  final String? airQuality;
  final String? weatherAlert;
  final int? numberOfDays;
  final String? apiKey;

  const APIQuery(
      {this.nameLocation,
      this.airQuality,
      this.weatherAlert,
      this.numberOfDays,
      this.apiKey = kApiKey});
}
