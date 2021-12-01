import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/injector.dart';
import 'package:weather_app/src/modules/favorite/business_logic/favorite_country_cubit.dart';
import 'package:weather_app/src/modules/forecast/business_logic/forecast_weather_cubit.dart';
import 'package:weather_app/src/modules/nav_bar/nav_bar.dart';

import 'src/config/themes/theme.dart';
import 'src/modules/home/business_logic/current_weather_cubit.dart';

void main() {
  initializeDependencies();
  runApp(const WeatherApp());
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: theme,
        home: const NavBar(),
      ),
    );
  }
}
