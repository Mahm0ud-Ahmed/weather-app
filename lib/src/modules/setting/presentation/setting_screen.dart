import 'package:flutter/material.dart';
import 'package:weather_app/src/modules/setting/presentation/widget/details_my_location_weather.dart';
import 'package:weather_app/src/modules/setting/presentation/widget/favorite_settings_for_weather.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Celsius';
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DetailsMyLocationWeather(),
              const Divider(),
              FavoriteSettingsForWeather(
                title: 'Temperature:',
                dropdownValue: 'Celsius',
                valueGroup: const ['Celsius', 'Fahrenheit'],
                onChooseItem: () {},
              ),
              FavoriteSettingsForWeather(
                title: 'Wind Speed:',
                dropdownValue: 'Km/h',
                valueGroup: const ['Km/h', 'Mph/h'],
                onChooseItem: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
