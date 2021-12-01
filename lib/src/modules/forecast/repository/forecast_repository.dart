import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/api_query/api_query.dart';
import 'package:weather_app/src/core/shared/remote/api_error/entity/api_error.dart';
import 'package:weather_app/src/data/repositories/main_repository.dart';
import 'package:weather_app/src/modules/forecast/entity/forecast.dart';

class ForecastRepository {
  final MainRepository? repository;

  ForecastRepository({this.repository});

  Future<Either<APIError, Forecast>> getForecast(APIQuery param) async {
    return await repository!.getForecast(param)
      ..fold((APIError error) {
        // print(error.message);
        return error;
      }, (Forecast forecast) {
        // print(forecast.forecast!.forecast![0].hourInfo![0].condition!.text);
        return forecast;
      });
  }
}
