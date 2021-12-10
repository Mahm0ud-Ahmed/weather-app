import 'package:get_it/get_it.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/data/repositories/main_repository.dart';
import 'package:weather_app/src/data/resources/local/app_database.dart';
import 'package:weather_app/src/data/resources/remote/weather_api.dart';
import 'package:weather_app/src/modules/favorite/business_logic/favorite_country_cubit.dart';
import 'package:weather_app/src/modules/favorite/repository/favorite_repository.dart';
import 'package:weather_app/src/modules/forecast/business_logic/forecast_weather_cubit.dart';
import 'package:weather_app/src/modules/forecast/repository/forecast_repository.dart';
import 'package:weather_app/src/modules/other_country/business_logic/other_country_cubit.dart';
import 'package:weather_app/src/modules/other_country/repository/other_country_repository.dart';

import 'modules/home/business_logic/current_weather_cubit.dart';
import 'modules/home/repository/weather_repository.dart';

final injector = GetIt.instance;

initializeDependencies() async {
  //Local Database
  final database =
      await $FloorAppDatabase.databaseBuilder(kDatabaseName).build();
  injector.registerSingleton<AppDatabase>(database);

  // API Dependence
  injector.registerSingleton<WeatherAPI>(WeatherAPI());

  // Main Repository Dependence
  injector.registerSingleton<MainRepository>(
    MainRepository(api: injector()),
  );

  // Sub Weather Repository Dependence
  injector.registerSingleton<WeatherRepository>(
    WeatherRepository(repository: injector(), database: injector()),
  );

  // Sub Forecast Repository Dependence
  injector.registerSingleton<ForecastRepository>(
    ForecastRepository(repository: injector()),
  );

  // Sub Favorite Repository Dependence
  injector.registerSingleton<FavoriteRepository>(
    FavoriteRepository(repository: injector()),
  );

  // Sub Other Country Repository Dependence
  injector.registerSingleton<OtherCountryRepository>(
    OtherCountryRepository(repository: injector()),
  );

  // Current Weather Cubit Dependence
  injector.registerFactory<CurrentWeatherCubit>(
    () => CurrentWeatherCubit(repository: injector(), database: injector()),
  );

  // Forecast Weather Cubit Dependence
  injector.registerFactory<ForecastWeatherCubit>(
    () => ForecastWeatherCubit(repository: injector()),
  );

  // Favorite Weather Cubit Dependence
  injector.registerFactory<FavoriteCountryCubit>(
      () => FavoriteCountryCubit(repository: injector(), database: injector()));

  // Other Country Cubit Dependence
  injector.registerFactory<OtherCountryCubit>(
      () => OtherCountryCubit(database: injector(), repository: injector()));
}
