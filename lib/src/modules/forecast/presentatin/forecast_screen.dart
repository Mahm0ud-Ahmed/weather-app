import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/modules/forecast/presentatin/widget/forecast_grid.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: hasConnection
          ? const ForecastGrid()
          : Center(
              child: Text(
              'please check your Internet connection!',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            )),
    );
  }
}
