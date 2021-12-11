import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/utils/constant.dart';
import 'package:weather_app/src/modules/forecast/business_logic/forecast_weather_cubit.dart';
import 'package:weather_app/src/modules/forecast/business_logic/forecast_weather_state.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast_day.dart';
import 'package:weather_app/src/modules/forecast/presentatin/widget/build_item.dart';

class ForecastGrid extends StatefulWidget {
  const ForecastGrid({Key? key}) : super(key: key);

  @override
  _ForecastGridState createState() => _ForecastGridState();
}

class _ForecastGridState extends State<ForecastGrid> {
  ForecastWeatherCubit? _cubit;
  List<ForecastDay>? _forecasts;

  @override
  void initState() {
    super.initState();
    _cubit ??= ForecastWeatherCubit.get(context);
    _cubit!.getForecasts();
    _forecasts ??= _cubit!.forecasts;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastWeatherCubit, ForecastWeatherState>(
        builder: (context, state) {
      if (state is SuccessForecastsWeather) {
        _forecasts = state.forecasts;
      }
      return _forecasts != null
          ? GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 2 / 2.4
                        : 2 / 2.5,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: _forecasts!.length,
              itemBuilder: (context, index) {
                return BuildItem(
                  index: index,
                  dayName:
                      _cubit!.convertDateToDayName(_forecasts![index].date!),
                  maxTemp: temperature!.contains('C')
                      ? _forecasts![index].dayInfo!.maxTempC.toString()
                      : _forecasts![index].dayInfo!.maxTempF.toString(),
                  minTemp: temperature!.contains('C')
                      ? _forecasts![index].dayInfo!.minTempC.toString()
                      : _forecasts![index].dayInfo!.minTempF.toString(),
                  pathImg: _forecasts![index]
                      .dayInfo!
                      .condition!
                      .icon!
                      .replaceAll('//', 'https://'),
                  stateSun: _forecasts![index].dayInfo!.condition!.text!,
                );
              },
            )
          : const Center(child: CircularProgressIndicator());
    });
  }
}
