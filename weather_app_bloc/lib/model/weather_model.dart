import 'package:weather_app_bloc/presentation/widgets/utils.dart';

class WeatherModel {
  String place;
  double currentTemp;
  String currentSky;
  double currentPressure;
  double currentWindSpeed;
  double currentHumidity;
  String currentWeatherDescription;
  String currentWeather;
  DateTime currentDateTime;

  WeatherModel({
    required this.place,
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
    required this.currentWeather,
    required this.currentDateTime,
    required this.currentWeatherDescription,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map;
    DateTime currentDateTime =
        DateTime.parse(currentWeatherData['list'][0]['dt_txt']);

    return WeatherModel(
        place: currentWeatherData['city']['name'].toString(),
        currentWeather: currentWeatherData['list'][0]['weather'][0]['main'],
        currentWeatherDescription: currentWeatherData['list'][0]['weather'][0]
            ['description'],
        currentDateTime: currentDateTime,
        currentTemp: kelvinToCelsius(
            currentWeatherData['list'][0]['main']['temp'].toDouble()),
        currentSky: currentWeatherData['list'][0]['weather'][0]['main'],
        currentPressure:
            currentWeatherData['list'][0]['main']['pressure'].toDouble(),
        currentWindSpeed:
            currentWeatherData['list'][0]['wind']['speed'].toDouble(),
        currentHumidity:
            currentWeatherData['list'][0]['main']['humidity'].toDouble());
  }

  Map<String, dynamic> toMap() {
    return {
      'place': place,
      'currentTemp': currentTemp,
      'currentSky': currentSky,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
      'currentWeather': currentWeather,
      'currentWeatherDescription': currentWeatherDescription,
      'currentDateTime': formatDateTime(currentDateTime)
    };
  }
}
