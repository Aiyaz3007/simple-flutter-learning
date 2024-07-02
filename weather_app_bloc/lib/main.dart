import 'package:flutter/material.dart';
import 'package:weather_app_bloc/presentation/screens/home_screen.dart';
import 'package:weather_app_bloc/presentation/screens/weather_page_screen.dart';
import 'package:weather_app_bloc/presentation/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        } else if (settings.name == '/weather_page') {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => WeatherPageScreen(place: args),
          );
        }
        return null;
      },
    );
  }
}
