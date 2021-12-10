import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:weather_app/src/core/utils/constant.dart';

@Entity(tableName: kWeatherMyCountryTableName)
class MyCountryWeather extends Equatable {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? date;
  double? tempC;
  double? tempF;
  String? urlIcon;
  String? sunState;
  String? location;
  int? humidity;
  int? cloud;
  double? windK;
  double? windM;
  String? sunrise;
  String? sunset;

  MyCountryWeather(
      {this.id,
      this.date,
      this.tempC,
      this.tempF,
      this.urlIcon,
      this.sunState,
      this.location,
      this.humidity,
      this.cloud,
      this.windK,
      this.windM,
      this.sunrise,
      this.sunset});

  @override
  List<Object?> get props => [
        id,
        date,
        urlIcon,
        wind,
        humidity,
        tempC,
        location,
        tempF,
        sunrise,
        sunset,
        cloud,
        sunState,
      ];

  @override
  bool get stringify => true;
}
