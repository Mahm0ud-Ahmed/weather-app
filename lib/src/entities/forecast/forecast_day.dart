import 'package:equatable/equatable.dart';
import 'package:weather_app/src/entities/forecast/astro.dart';
import 'package:weather_app/src/entities/forecast/day_info.dart';
import 'package:weather_app/src/entities/forecast/hour_info.dart';

class ForecastDay extends Equatable {
  String? date;
  DayInfo? dayInfo;
  Astro? astro;
  List<HourInfo>? hourInfo;

  ForecastDay({this.date, this.dayInfo, this.astro, this.hourInfo});

  @override
  List<Object?> get props => [date, dayInfo, astro, hourInfo];

  @override
  bool get stringify => true;
}
