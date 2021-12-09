import 'package:flutter/material.dart';
import 'package:weather_app/src/config/themes/icon_broken.dart';
import 'package:weather_app/src/core/shared/widget/custom_banner.dart';
import 'package:weather_app/src/core/shared/widget/custom_container_with_shadow.dart';

class MainWeatherCard extends StatelessWidget {
  const MainWeatherCard(
      {Key? key,
      this.date,
      this.temp,
      this.pathIcon,
      this.stateWeather,
      this.nameAria,
      this.country})
      : super(key: key);

  final String? date;
  final double? temp;
  final String? pathIcon;
  final String? stateWeather;
  final String? nameAria;
  final String? country;

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithShadow(
      padding: const EdgeInsets.symmetric(vertical: 12),
      backgroundColor: Colors.white,
      child: AspectRatio(
        aspectRatio: MediaQuery.of(context).orientation == Orientation.portrait
            ? 1.4
            : 4.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            dayAndDate(context, date!),
            weatherData(context, temp!, pathIcon!),
            textWeather(context, stateWeather!),
            locationData(context, nameAria!, country!),
          ],
        ),
      ),
    );
  }

  Widget dayAndDate(BuildContext context, String date) {
    return Row(
      children: [
        CustomBanner(
          child: Text(
            'Today',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(date.split(' ').first),
        ),
      ],
    );
  }

  Widget weatherData(BuildContext context, double temp, String pathIcon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '$temp °',
          style: Theme.of(context).textTheme.headline3,
        ),
        Image.network(
          pathIcon.replaceAll('//', 'https://'),
        ),
      ],
    );
  }

  Widget textWeather(BuildContext context, String stateWeather) {
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
              fontSize: 18,
              fontFamily: 'Nova',
            ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget locationData(BuildContext context, String aria, String country) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const Icon(IconBroken.Location),
          const SizedBox(
            width: 4,
          ),
          Text('$aria${', '}$country'),
        ],
      ),
    );
  }
}
