import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:weather_app/src/core/utils/constant.dart';

@Entity(tableName: kFavoriteTableName)
class Favorite extends Equatable {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? date;
  double? tempC;
  double? tempF;
  String? urlIcon;
  String? region;
  String? country;
  String? latLong;
  int? humidity;
  double? wind;

  Favorite(
      {this.id,
      this.date,
      this.tempC,
      this.tempF,
      this.urlIcon,
      this.region,
      this.country,
      this.latLong,
      this.humidity,
      this.wind});

  @override
  List<Object?> get props => [
        id,
        tempC,
        urlIcon,
        region,
        country,
        humidity,
        wind,
        tempF,
        latLong,
        date
      ];

  @override
  bool get stringify => true;
}
