import 'package:equatable/equatable.dart';

import '../../../core/shared/remote/api_error/entity/astro.dart';
import 'day_info.dart';
import 'hour_info.dart';

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
