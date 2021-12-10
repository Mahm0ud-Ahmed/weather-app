import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/config/themes/icon_broken.dart';
import 'package:weather_app/src/core/shared/widget/weather_details.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/modules/setting/business_logic/setting_weather_cubit.dart';

class LocalDetailsMyLocationWeather extends StatelessWidget {
  const LocalDetailsMyLocationWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              IconBroken.Location,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              'Your Location Now',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
            ),
          ],
        ),
        Text(
          locationAddress!,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 8,
        ),
        Image.asset(
          'assets/images/no_image.png',
          width: 100,
          height: 100,
        ),
        const SizedBox(
          height: 8,
        ),
        buildTextStateWeather(context, myCountryWeatherDB!.sunState!),
        const SizedBox(
          height: 32,
        ),
        BlocBuilder<SettingWeatherCubit, SettingWeatherState>(
          builder: (context, state) {
            return Text(
              temperature!.contains('C')
                  ? myCountryWeatherDB!.tempC!.toInt().toString() + '°'
                  : myCountryWeatherDB!.tempF!.toString() + '°',
              style: Theme.of(context).textTheme.headline1,
            );
          },
        ),
        BlocBuilder<SettingWeatherCubit, SettingWeatherState>(
          builder: (context, state) {
            return WeatherDetails(
              wind: wind!.contains('K')
                  ? myCountryWeatherDB!.windK!.toString() + ' Km/h'
                  : myCountryWeatherDB!.windM!.toString() + ' Mph/h',
              cloud: myCountryWeatherDB!.cloud!.toString(),
              humidity: myCountryWeatherDB!.humidity!.toString(),
            );
          },
        ),
      ],
    );
  }

  Widget buildTextStateWeather(BuildContext context, String stateWeather) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.shade100.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        stateWeather,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: 'Nova',
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
