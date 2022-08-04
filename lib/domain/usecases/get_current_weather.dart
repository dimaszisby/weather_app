import 'package:dartz/dartz.dart';

import '../../data/failure.dart';
import '../entities/current_weather.dart';
import '../repositories/weather_repository.dart';


class GetCurrentWeather {
  final WeatherRepository repository;

  GetCurrentWeather(this.repository);

  Future<Either<Failure, CurrentWeather>> execute(double lat, double long) {
    return repository.getCurrentWeather(lat, long);
  }
}
