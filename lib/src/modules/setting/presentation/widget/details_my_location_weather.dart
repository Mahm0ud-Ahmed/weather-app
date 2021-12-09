import 'package:flutter/material.dart';
import 'package:weather_app/src/config/themes/icon_broken.dart';
import 'package:weather_app/src/core/shared/widget/weather_details.dart';

class DetailsMyLocationWeather extends StatelessWidget {
  const DetailsMyLocationWeather({Key? key}) : super(key: key);

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
          'Saqqarah, Al Jizah, Egypt',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 32,
        ),
        const Icon(
          Icons.wb_sunny_sharp,
          size: 100,
        ),
        const SizedBox(
          height: 16,
        ),
        buildTextStateWeather(context, 'Shine'),
        const SizedBox(
          height: 32,
        ),
        Text(
          '20°',
          style: Theme.of(context).textTheme.headline1,
        ),
        const WeatherDetails(
          wind: '13.0',
          cloud: '25',
          humidity: '56',
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
