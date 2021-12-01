import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/api_query/api_query.dart';
import 'package:weather_app/src/core/shared/widget/main_weather_card.dart';
import 'package:weather_app/src/core/shared/widget/sun_info.dart';
import 'package:weather_app/src/core/shared/widget/weather_details.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast_day.dart';
import 'package:weather_app/src/modules/home/business_logic/current_weather_cubit.dart';
import 'package:weather_app/src/modules/home/business_logic/current_weather_state.dart';
import 'package:weather_app/src/modules/home/entity/country_weather.dart';
import 'package:weather_app/src/modules/home/presentation/widget/hours_weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CountryWeather? _currentWeather;
  CurrentWeatherCubit? _cubit;
  List<ForecastDay>? _forecasts;

  @override
  void initState() {
    super.initState();
    _cubit ??= CurrentWeatherCubit.get(context);
    _cubit!.getCurrentWeather(APIQuery(nameLocation: 'Egypt'));
    _cubit!.getForecasts(APIQuery(nameLocation: 'Egypt'));
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
          }
          if (state is SuccessForecastsWeather) {
            _forecasts = state.forecasts!;
          }
          print('Weather ${_currentWeather == null}');
          print('Forecast: ${_forecasts == null}');
          return _currentWeather != null && _forecasts != null
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Column(
                    children: [
                      MainWeatherCard(
                        date: _currentWeather!.location!.localtime,
                        temp: _currentWeather!.weatherInfo!.tempC,
                        pathIcon: _currentWeather!.weatherInfo!.condition!.icon,
                        stateWeather:
                            _currentWeather!.weatherInfo!.condition!.text,
                        nameAria: _currentWeather!.location!.name,
                        country: _currentWeather!.location!.country,
                      ),
                      WeatherDetails(
                        humidity:
                            _currentWeather!.weatherInfo!.humidity.toString(),
                        cloud: _currentWeather!.weatherInfo!.cloud.toString(),
                        wind: _currentWeather!.weatherInfo!.windKph.toString(),
                      ),
                      SunInfo(
                        sunrise: _forecasts![0].astro!.sunrise,
                        sunset: _forecasts![0].astro!.sunset,
                      ),
                      Divider(
                        color: Colors.blue.shade200,
                      ),
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
