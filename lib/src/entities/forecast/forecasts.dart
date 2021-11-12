import 'package:equatable/equatable.dart';
import 'forecast_day.dart';

class Forecasts extends Equatable {
  List<ForecastDay>? forecast;

  Forecasts({this.forecast});

  @override
  List<Object?> get props => [forecast];

  @override
  bool get stringify => true;
}
