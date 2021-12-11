import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/config/themes/icon_broken.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/astro.dart';
import 'package:weather_app/src/core/shared/widget/main_weather_card.dart';
import 'package:weather_app/src/core/shared/widget/sun_info.dart';
import 'package:weather_app/src/core/shared/widget/weather_details.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/modules/favorite/entity/local/favorite.dart';
import 'package:weather_app/src/modules/home/entity/remote/country_weather.dart';
import 'package:weather_app/src/modules/other_country/business_logic/other_country_cubit.dart';

class OtherCountryDetails extends StatefulWidget {
  const OtherCountryDetails({Key? key, this.lat, this.long}) : super(key: key);

  final double? lat;
  final double? long;

  @override
  State<OtherCountryDetails> createState() => _OtherCountryDetailsState();
}

class _OtherCountryDetailsState extends State<OtherCountryDetails> {
  OtherCountryCubit? _cubit;
  CountryWeather? currentWeather;
  Astro? astro;

  @override
  void initState() {
    _cubit = OtherCountryCubit.get(context);
    _cubit!.getFavoriteCountry().then((value) {
      _cubit!.getWeatherDetailsForCountry(widget.lat!, widget.long!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.indigo,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(IconBroken.Arrow___Left),
        ),
      ),
      body: hasConnection
          ? SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: BlocBuilder<OtherCountryCubit, OtherCountryState>(
                    builder: (context, state) {
                      if (state is SuccessCountryDetails) {
                        currentWeather = _cubit!.weather;
                        astro = _cubit!.sunInfo;
                      }
                      return currentWeather != null && astro != null
                          ? Column(
                              children: [
                                MainWeatherCard(
                                  date: currentWeather!.location!.localtime,
                                  temp: currentWeather!.weatherInfo!.tempC!
                                      .toInt()
                                      .toString(),
                                  pathIcon: currentWeather!
                                      .weatherInfo!.condition!.icon,
                                  stateWeather: currentWeather!
                                      .weatherInfo!.condition!.text,
                                  locationAddress:
                                      currentWeather!.location!.name,
                                ),
                                WeatherDetails(
                                  humidity: currentWeather!
                                      .weatherInfo!.humidity
                                      .toString(),
                                  cloud: currentWeather!.weatherInfo!.cloud
                                      .toString(),
                                  wind: currentWeather!.weatherInfo!.windKph
                                      .toString(),
                                ),
                                SunInfo(
                                  sunset: astro!.sunset,
                                  sunrise: astro!.sunrise,
                                ),
                              ],
                            )
                          : const Center(child: LinearProgressIndicator());
                    },
                  ),
                ),
              ),
            )
          : Center(
              child: Text(
              'please check your Internet connection!',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            )),
      floatingActionButton: BlocBuilder<OtherCountryCubit, OtherCountryState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                  width: 2,
                  color: _cubit!.isFavorite != null && _cubit!.isFavorite!
                      ? Colors.red
                      : Colors.black12),
            ),
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color: _cubit!.isFavorite != null && _cubit!.isFavorite!
                    ? Colors.red
                    : Colors.grey,
              ),
              onPressed: () {
                _cubit!.saveOrDeleteCountry(Favorite(
                  date: currentWeather!.location!.localtime!.split(' ').first,
                  region: currentWeather!.location!.name,
                  country: currentWeather!.location!.country,
                  latLong: currentWeather!.location!.lat.toString() +
                      ',' +
                      currentWeather!.location!.long.toString(),
                  tempC: currentWeather!.weatherInfo!.tempC,
                  tempF: currentWeather!.weatherInfo!.tempF,
                  urlIcon: currentWeather!.weatherInfo!.condition!.icon,
                  humidity: currentWeather!.weatherInfo!.humidity,
                  wind: currentWeather!.weatherInfo!.windKph,
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
