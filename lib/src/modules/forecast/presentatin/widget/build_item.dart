import 'package:flutter/material.dart';
import 'package:weather_app/src/core/shared/widget/custom_banner.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({
    Key? key,
    this.index,
    this.dayName,
    this.maxTemp,
    this.minTemp,
    this.pathImg,
    this.stateSun,
  }) : super(key: key);

  final int? index;
  final String? dayName;
  final String? maxTemp;
  final String? minTemp;
  final String? pathImg;
  final String? stateSun;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade100.withOpacity(0.6),
            blurRadius: 20,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: buildDayName(context, dayName!, index!),
              ),
              RichText(
                text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 24, color: Colors.black45),
                  children: [
                    TextSpan(
                      text: '${maxTemp!} °',
                      style: TextStyle(color: Colors.blue.shade300),
                    ),
                    TextSpan(
                      text: ' / ',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 16),
                    ),
                    TextSpan(
                      text: '${minTemp!} °',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 16, color: Colors.black38),
                    ),
                  ],
                ),
              ),
              Image.network(
                pathImg!,
              ),
              buildTextStateWeather(context, stateSun!),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDayName(BuildContext context, String dayName, int index) {
    return CustomBanner(
      child: Text(
        index == 0
            ? 'Today'
            : index == 1
                ? 'Tomorrow'
                : dayName,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: 'Nova',
            ),
        textAlign: TextAlign.center,
      ),
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
