import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/api_query/api_query.dart';
import 'package:weather_app/src/core/shared/widget/main_weather_card.dart';
import 'package:weather_app/src/core/shared/widget/sun_info.dart';
import 'package:weather_app/src/core/shared/widget/weather_details.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast_day.dart';
import 'package:weather_app/src/modules/home/business_logic/current_weather_cubit.dart';
import 'package:weather_app/src/modules/home/business_logic/current_weather_state.dart';
import 'package:weather_app/src/modules/home/entity/local/my_country_weather.dart';
import 'package:weather_app/src/modules/home/entity/remote/country_weather.dart';
import 'package:weather_app/src/modules/home/presentation/widget/hours_weather.dart';
import 'package:weather_app/src/modules/home/presentation/widget/local_details_my_weather.dart';
import 'package:weather_app/src/modules/home/presentation/widget/remote_details_my_weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CountryWeather? _currentWeather;
  MyCountryWeather? _myCountryWeatherDB;
  CurrentWeatherCubit? _cubit;
  List<ForecastDay>? _forecasts;

  @override
  void initState() {
    super.initState();
    _cubit ??= CurrentWeatherCubit.get(context);
    _cubit!.getWeatherForCountry();
    _currentWeather ??= _cubit!.weather;
    _forecasts ??= _cubit!.forecasts;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
        builder: (context, state) {
          if (state is SuccessCurrentWeather) {
            _currentWeather = state.currentWeather!;
            _forecasts = state.forecasts!;
          }
          if (state is SuccessCurrentWeatherDatabase) {
            _myCountryWeatherDB = state.myCountryWeatherDB;
          }
          return state is SuccessCurrentWeather ||
                  state is SuccessCurrentWeatherDatabase
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Column(
                    children: [
                      hasConnection
                          ? RemoteDetailsMyWeather(
                              currentWeather: _currentWeather,
                              forecasts: _forecasts)
                          : LocalDetailsMyWeather(
                              myCountryWeatherDB: _myCountryWeatherDB),
                      Divider(
                        color: Colors.blue.shade200,
                      ),
                      if (hasConnection)
                        HoursWeather(
                          hourInfo: _cubit!.hoursInfo,
                        ),
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
