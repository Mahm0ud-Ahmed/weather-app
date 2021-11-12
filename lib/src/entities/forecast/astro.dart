import 'package:equatable/equatable.dart';

class Astro extends Equatable {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonSet;
  String? moonPhase;
  String? moonIllumination;

  Astro(
      {this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonSet,
      this.moonPhase,
      this.moonIllumination});

  @override
  List<Object?> get props => [
        sunrise,
        sunset,
        moonrise,
        moonSet,
        moonPhase,
        moonIllumination,
      ];

  @override
  bool get stringify => true;
}
