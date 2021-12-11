import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/config/themes/icon_broken.dart';
import 'package:weather_app/src/core/utils/constant.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {Key? key,
      this.date,
      this.temp,
      this.urlIcon,
      this.region,
      this.country,
      this.humidity,
      this.wind,
      this.onUpdate})
      : super(key: key);
  final String? date;
  final String? temp;
  final String? urlIcon;
  final String? region;
  final String? country;
  final String? humidity;
  final String? wind;
  final Function()? onUpdate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      temp! + ' °',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 24, color: Colors.blue.shade300),
                    ),
                    hasConnection
                        ? FadeInImage.assetNetwork(
                            placeholder: 'assets/images/no_image.png',
                            image: urlIcon!.replaceAll('//', 'https://'),
                            width: 64,
                            height: 64,
                          )
                        : Image.asset(
                            'assets/images/no_image.png',
                            width: 64,
                            height: 64,
                          ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
                Expanded(
                  child: Text(
                    region!,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Text(
                    country!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildWeatherDetails(context,
                        imgPath: 'assets/images/humidity.png',
                        ratio: humidity! + '%'),
                    buildWeatherDetails(context,
                        imgPath: 'assets/images/wind.png',
                        ratio: wind! + 'K/h'),
                  ],
                ),
              ],
            ),
          ),
          getCurrentDateNow() != date
              ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.black.withOpacity(0.65),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton.icon(
                        onPressed: onUpdate,
                        icon: const Icon(
                          IconBroken.Info_Circle,
                          color: Colors.white70,
                        ),
                        label: const Text(
                          'Update',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget buildWeatherDetails(BuildContext context,
      {String? imgPath, String? ratio}) {
    return Row(
      children: [
        Image.asset(
          imgPath!,
          width: 18,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(ratio!),
      ],
    );
  }

  String getCurrentDateNow() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }
}
