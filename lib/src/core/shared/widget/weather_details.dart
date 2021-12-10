import 'package:flutter/material.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({Key? key, this.humidity, this.cloud, this.wind})
      : super(key: key);

  final String? humidity;
  final String? cloud;
  final String? wind;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildWeatherDetails('assets/images/humidity.png', humidity! + ' %'),
          buildWeatherDetails('assets/images/cloudy.png', cloud! + ' %'),
          buildWeatherDetails('assets/images/wind.png', wind!),
        ],
      ),
    );
  }

  Widget buildWeatherDetails(String imgPath, String ratio) {
    return Row(
      children: [
        Image.asset(
          imgPath,
          width: 32,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(ratio),
      ],
    );
  }
}
