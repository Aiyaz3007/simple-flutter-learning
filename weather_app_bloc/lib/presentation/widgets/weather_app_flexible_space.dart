import 'package:flutter/material.dart';
import 'package:weather_app_bloc/model/weather_model.dart';
import 'package:weather_app_bloc/presentation/colors.dart';
import 'package:weather_app_bloc/presentation/widgets/utils.dart';

class WeatherAppFlexibleSpace extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherAppFlexibleSpace({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.appBackgroundColor,
            border: Border.all(color: Colors.transparent)),
        padding: EdgeInsets.only(top: 100),
        child: Container(
          width: 300,
          height: 500,
          decoration: BoxDecoration(
              color: AppColors.appBackgroundColor,
              border: Border.all(color: Colors.transparent)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    weatherModel.place,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Icon(
                Icons.sunny,
                size: 180,
                color: const Color.fromRGBO(255, 209, 104, 1),
              ),
              Text(
                "${weatherModel.currentTemp}°C",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 65,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                formatDateTime(weatherModel.currentDateTime),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                weatherModel.currentWeather,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      stretchModes: [
        StretchMode.zoomBackground,
        StretchMode.blurBackground,
        StretchMode.fadeTitle,
      ],
    );
  }
}
