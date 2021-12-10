import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:weather_app/src/data/resources/local/dao/favorite_dao.dart';
import 'package:weather_app/src/data/resources/local/dao/my_country_dao.dart';
import 'package:weather_app/src/modules/favorite/entity/local/favorite.dart';
import 'package:weather_app/src/modules/home/entity/local/my_country_weather.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Favorite, MyCountryWeather])
abstract class AppDatabase extends FloorDatabase {
  FavoriteDao get favoriteDao;
  MyCountryDao get myCountryDao;
}
