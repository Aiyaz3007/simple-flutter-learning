import 'dart:convert';

import 'package:weather_app_bloc/data/data_provider/weather_data_provider.dart';
import 'package:weather_app_bloc/model/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider _weatherDataProvider;
  final String cityName;

  WeatherRepository(this._weatherDataProvider, this.cityName);

  Future<WeatherModel> getCurrentWeather() async {
    final weatherData = await _weatherDataProvider.getCurrentWeather(cityName);
    return WeatherModel.fromMap(
      jsonDecode(weatherData),
    );
  }
}
