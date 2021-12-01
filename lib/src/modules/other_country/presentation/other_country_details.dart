import 'package:flutter/material.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/astro.dart';
import 'package:weather_app/src/core/shared/widget/main_weather_card.dart';
import 'package:weather_app/src/core/shared/widget/sun_info.dart';
import 'package:weather_app/src/core/shared/widget/weather_details.dart';
import 'package:weather_app/src/modules/home/entity/country_weather.dart';

class OtherCountryDetails extends StatelessWidget {
  const OtherCountryDetails({Key? key, this.currentWeather, this.astro})
      : super(key: key);

  final CountryWeather? currentWeather;
  final Astro? astro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
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
                  sunset: astro!.sunset,
                  sunrise: astro!.sunrise,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(width: 2, color: Colors.black12),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.favorite,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
