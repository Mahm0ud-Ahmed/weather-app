import 'package:flutter/material.dart';
import 'package:weather_app/src/modules/forecast/presentatin/widget/forecast_grid.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: ForecastGrid(),
    );
  }
}
