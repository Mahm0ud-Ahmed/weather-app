import 'package:get_it/get_it.dart';
import 'package:weather_app/src/data/repositories/weather_repository.dart';
import 'package:weather_app/src/data/resources/remote/weather_api.dart';
import 'package:weather_app/src/view_model/current_weather_cubit.dart';

final injector = GetIt.instance;

initializeDependencies() {
  injector.registerSingleton<WeatherAPI>(WeatherAPI());
  injector
      .registerSingleton<WeatherRepository>(WeatherRepository(api: injector()));
  injector.registerFactory<CurrentWeatherCubit>(
    () => CurrentWeatherCubit(repository: injector()),
  );
}
