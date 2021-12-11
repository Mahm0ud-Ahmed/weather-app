import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/config/themes/icon_broken.dart';
import 'package:weather_app/src/core/shared/widget/weather_details.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/modules/choose_country/presentation/choose_country.dart';
import 'package:weather_app/src/modules/setting/business_logic/setting_weather_cubit.dart';

class RemoteDetailsMyLocationWeather extends StatelessWidget {
  const RemoteDetailsMyLocationWeather({Key? key}) : super(key: key);

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
        TextButton.icon(
          icon: const Icon(IconBroken.Edit),
          label: Text(
            locationAddress!,
            style: Theme.of(context).textTheme.headline6,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const ChooseCountry();
              },
            ));
          },
        ),
        const SizedBox(
          height: 8,
        ),
        FadeInImage.assetNetwork(
          placeholder: 'assets/images/no_image.png',
          image: weather!.weatherInfo!.condition!.icon!
              .replaceAll('//', 'https://'),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 8,
        ),
        buildTextStateWeather(context, weather!.weatherInfo!.condition!.text!),
        const SizedBox(
          height: 32,
        ),
        BlocBuilder<SettingWeatherCubit, SettingWeatherState>(
          builder: (context, state) {
            return Text(
              temperature!.contains('C')
                  ? weather!.weatherInfo!.tempC!.toInt().toString() + '°'
                  : weather!.weatherInfo!.tempF!.toString() + '°',
              style: Theme.of(context).textTheme.headline1,
            );
          },
        ),
        BlocBuilder<SettingWeatherCubit, SettingWeatherState>(
          builder: (context, state) {
            return WeatherDetails(
              wind: wind!.contains('K')
                  ? weather!.weatherInfo!.windKph!.toString() + ' Km/h'
                  : weather!.weatherInfo!.windMph!.toString() + ' Mph/h',
              cloud: weather!.weatherInfo!.cloud!.toString(),
              humidity: weather!.weatherInfo!.humidity!.toString(),
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
