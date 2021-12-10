import 'package:flutter/material.dart';
import 'package:weather_app/src/core/shared/widget/main_weather_card.dart';
import 'package:weather_app/src/core/shared/widget/sun_info.dart';
import 'package:weather_app/src/core/shared/widget/weather_details.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast_day.dart';
import 'package:weather_app/src/modules/home/entity/remote/country_weather.dart';

class RemoteDetailsMyWeather extends StatelessWidget {
  const RemoteDetailsMyWeather({Key? key, this.currentWeather, this.forecasts})
      : super(key: key);
  final CountryWeather? currentWeather;
  final List<ForecastDay>? forecasts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainWeatherCard(
          date: currentWeather!.location!.localtime,
          temp: currentWeather!.weatherInfo!.tempC,
          pathIcon: currentWeather!.weatherInfo!.condition!.icon,
          stateWeather: currentWeather!.weatherInfo!.condition!.text,
          nameAria: currentWeather!.location!.name,
          country: currentWeather!.location!.country,
        ),
        WeatherDetails(
          humidity: currentWeather!.weatherInfo!.humidity.toString(),
          cloud: currentWeather!.weatherInfo!.cloud.toString(),
          wind: currentWeather!.weatherInfo!.windKph.toString(),
        ),
        SunInfo(
          sunrise: forecasts![0].astro!.sunrise,
          sunset: forecasts![0].astro!.sunset,
        ),
      ],
    );
  }
}
