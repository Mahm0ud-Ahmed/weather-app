import 'package:weather_app/src/core/utils/constant.dart';

class ParameterAPI {
  String? nameLocation;
  String? airQuality;
  String? weatherAlert;
  int? numberOfDays;
  String? apiKey;

  ParameterAPI(
      {this.nameLocation,
      this.airQuality = 'no',
      this.weatherAlert = 'no',
      this.numberOfDays,
      this.apiKey = kApiKey});
}
