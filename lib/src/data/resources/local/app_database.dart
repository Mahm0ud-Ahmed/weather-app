import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:weather_app/src/data/resources/local/dao/favorite_dao.dart';
import 'package:weather_app/src/modules/favorite/entity/local/favorite.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Favorite])
abstract class AppDatabase extends FloorDatabase {
  FavoriteDao get favoriteDao;
}
