import 'package:flutter/material.dart';
import 'package:weather_app/src/core/shared/widget/main_weather_card.dart';
import 'package:weather_app/src/core/shared/widget/sun_info.dart';
import 'package:weather_app/src/core/shared/widget/weather_details.dart';
import 'package:weather_app/src/modules/home/entity/local/my_country_weather.dart';

class LocalDetailsMyWeather extends StatelessWidget {
  const LocalDetailsMyWeather({Key? key, this.myCountryWeatherDB})
      : super(key: key);
  final MyCountryWeather? myCountryWeatherDB;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainWeatherCard(
          date: myCountryWeatherDB!.date,
          temp: myCountryWeatherDB!.tempC,
          pathIcon: myCountryWeatherDB!.urlIcon,
          stateWeather: myCountryWeatherDB!.sunState,
          nameAria: myCountryWeatherDB!.location,
          country: '',
        ),
        WeatherDetails(
          humidity: myCountryWeatherDB!.humidity.toString(),
          cloud: myCountryWeatherDB!.cloud.toString(),
          wind: myCountryWeatherDB!.wind.toString(),
        ),
        SunInfo(
          sunrise: myCountryWeatherDB!.sunrise,
          sunset: myCountryWeatherDB!.sunset,
        ),
      ],
    );
  }
}