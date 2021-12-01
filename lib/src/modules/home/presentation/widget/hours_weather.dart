import 'package:flutter/material.dart';
import 'package:weather_app/src/modules/forecast/entity/hour_info.dart';

class HoursWeather extends StatelessWidget {
  const HoursWeather({Key? key, this.hourInfo}) : super(key: key);
  final List<HourInfo>? hourInfo;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (index < hourInfo!.length) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(hourInfo![index].time!.split(' ').last),
              Image.network(
                hourInfo![index].condition!.icon!.replaceAll('//', 'https://'),
                width: 48,
              ),
              Text(hourInfo![index].tempC!.toString() + ' °'),
            ],
          );
        } else {
          return const SizedBox(
            height: 50,
          );
        }
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.blue.shade200,
        );
      },
      itemCount: hourInfo!.length + 1,
    );
  }
}
