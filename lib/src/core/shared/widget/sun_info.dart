import 'package:flutter/material.dart';

class SunInfo extends StatelessWidget {
  const SunInfo({Key? key, this.sunrise, this.sunset}) : super(key: key);

  final String? sunrise;
  final String? sunset;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildSunInfo('assets/images/sunrise.png', sunrise!),
          buildSunInfo('assets/images/sunset.png', sunset!)
        ],
      ),
    );
  }

  Widget buildSunInfo(String imgPath, String time) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imgPath,
          width: 48,
        ),
        Text(time),
      ],
    );
  }
}
