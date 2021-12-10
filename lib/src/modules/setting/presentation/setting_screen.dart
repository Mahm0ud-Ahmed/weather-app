import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/data/resources/local/storage_pref.dart';
import 'package:weather_app/src/modules/setting/business_logic/setting_weather_cubit.dart';
import 'package:weather_app/src/modules/setting/presentation/widget/local_details_my_location_weather.dart';
import 'package:weather_app/src/modules/setting/presentation/widget/remote_details_my_location_weather.dart';
import 'package:weather_app/src/modules/setting/presentation/widget/favorite_settings_for_weather.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingWeatherCubit? _cubit;
  @override
  void initState() {
    _cubit = SettingWeatherCubit.get(context);
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: BlocBuilder<SettingWeatherCubit, SettingWeatherState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  hasConnection
                      ? const RemoteDetailsMyLocationWeather()
                      : const LocalDetailsMyLocationWeather(),
                  const Divider(),
                  FavoriteSettingsForWeather(
                    title: 'Temperature:',
                    dropdownValue: temperature,
                    valueGroup: const ['Celsius', 'Fahrenheit'],
                    onChooseItem: (String? newValue) =>
                        _cubit!.changeTempSettingWeather(newValue!),
                  ),
                  FavoriteSettingsForWeather(
                    title: 'Wind Speed:',
                    dropdownValue: wind,
                    valueGroup: const ['Km/h', 'Mph/h'],
                    onChooseItem: (String? newValue) =>
                        _cubit!.changeWindSettingWeather(newValue!),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
