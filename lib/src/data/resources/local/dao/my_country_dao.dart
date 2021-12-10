import 'package:floor/floor.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/modules/home/entity/local/my_country_weather.dart';

@dao
abstract class MyCountryDao {
  @Query('SELECT * FROM $kWeatherMyCountryTableName')
  Future<MyCountryWeather?> getWeatherForMyCountry();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertDataMyWeather(MyCountryWeather myCountryWeather);

  @update
  Future<int> updateDataMyWeather(MyCountryWeather myCountryWeather);

  @Query('DELETE FROM $kWeatherMyCountryTableName')
  Future<void> deleteAllData();
}
