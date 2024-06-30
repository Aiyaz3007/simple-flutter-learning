import 'package:http/http.dart' as http;
import 'package:weather_app_bloc/secrets.dart';

class WeatherDataProvider {
  Future<String> getCurrentWeather(String cityName) async {
    try {
      String url =
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$apiKey";
      final http.Response response = await http.get(Uri.parse(url));

      return response.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
