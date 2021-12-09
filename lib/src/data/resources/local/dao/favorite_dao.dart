import 'package:floor/floor.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/modules/favorite/entity/local/favorite.dart';

@dao
abstract class FavoriteDao {
  @Query('SELECT * FROM $kFavoriteTableName')
  Future<List<Favorite>> getAllFavorite();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertCountryForFavorite(Favorite favorite);

  @delete
  Future<int> deleteCountryFromFavorite(Favorite favorite);

  @update
  Future<int> updateCountryInFavorite(Favorite favorite);
}
