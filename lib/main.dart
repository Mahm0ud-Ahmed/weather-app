import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/data/resources/local/storage_pref.dart';
import 'package:weather_app/src/injector.dart';
import 'package:weather_app/src/modules/choose_country/business_logic/choose_country_cubit.dart';
import 'package:weather_app/src/modules/favorite/business_logic/favorite_country_cubit.dart';
import 'package:weather_app/src/modules/forecast/business_logic/forecast_weather_cubit.dart';
import 'package:weather_app/src/modules/nav_bar/nav_bar.dart';
import 'package:weather_app/src/modules/other_country/business_logic/other_country_cubit.dart';
import 'package:weather_app/src/modules/setting/business_logic/setting_weather_cubit.dart';
import 'package:weather_app/src/observer.dart';

import 'src/config/themes/theme.dart';
import 'src/modules/choose_country/presentation/choose_country.dart';
import 'src/modules/home/business_logic/current_weather_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  hasConnection = await InternetConnectionChecker().hasConnection;
  await initializeDependencies();
  await _initialStoragePrefAndGetData();
  BlocOverrides.runZoned(() => runApp(const WeatherApp()),
      blocObserver: MyBlocObserver());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrentWeatherCubit>(
          create: (context) => injector(),
        ),
        BlocProvider<ForecastWeatherCubit>(
          create: (context) => injector(),
        ),
        BlocProvider<FavoriteCountryCubit>(
          create: (context) => injector(),
        ),
        BlocProvider<OtherCountryCubit>(
          create: (context) => injector(),
        ),
        BlocProvider<SettingWeatherCubit>(
          create: (context) => injector(),
        ),
        BlocProvider<ChooseCountryCubit>(
          create: (context) => injector(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: theme,
        home: country == null ? const ChooseCountry() : const NavBar(),
      ),
    );
  }
}

Future<void> _initialStoragePrefAndGetData() async {
  await StoragePref.getInstance();
  wind = await StoragePref.getValue('wind') ?? 'Km/h';
  temperature = await StoragePref.getValue('temp') ?? 'Celsius';
  country = await StoragePref.getValue('country');
  locationAddress = await StoragePref.getValue('location');
}
