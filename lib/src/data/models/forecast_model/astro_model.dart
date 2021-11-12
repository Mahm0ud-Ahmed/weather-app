import 'package:weather_app/src/entities/forecast/astro.dart';

class AstroModel extends Astro {
  AstroModel({
    String? sunrise,
    String? sunset,
    String? moonrise,
    String? moonSet,
    String? moonPhase,
    String? moonIllumination,
  }) : super(
          sunrise: sunrise,
          sunset: sunset,
          moonrise: moonrise,
          moonSet: moonSet,
          moonPhase: moonPhase,
          moonIllumination: moonIllumination,
        );

  factory AstroModel.fromJson(Map<String, dynamic> json) {
    return AstroModel(
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: json['moonrise'],
      moonSet: json['moonset'],
      moonPhase: json['moon_phase'],
      moonIllumination: json['moon_illumination'],
    );
  }
}
