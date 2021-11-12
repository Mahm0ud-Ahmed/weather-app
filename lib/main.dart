import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/params/param.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/data/repositories/weather_repository.dart';
import 'package:weather_app/src/view_model/current_weather_cubit.dart';

import 'src/data/resources/remote/weather_api.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrentWeatherCubit>(
      create: (context) => CurrentWeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        home: Scaffold(
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'assets/images/icons/day/113.png',
                    fit: BoxFit.cover,
                  ),
                ),
                BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
                  builder: (context, state) {
                    final cubit = CurrentWeatherCubit(
                        repository: WeatherRepository(api: WeatherAPI()));
                    return ElevatedButton(
                        onPressed: () async {
                          await cubit.getCurrentWeather(kCurrentWeather,
                              ParameterAPI(nameLocation: 'egypt'));
                          await cubit.getForecasts(
                              kForecast,
                              ParameterAPI(
                                  nameLocation: 'fgh', numberOfDays: 3));
                        },
                        child: const Text('click Me'));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
