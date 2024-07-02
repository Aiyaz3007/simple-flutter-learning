import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weather/weather_bloc.dart';
import 'package:weather_app_bloc/model/weather_model.dart';
import 'package:weather_app_bloc/presentation/colors.dart';
import 'package:weather_app_bloc/presentation/widgets/weather_app_flexible_space.dart';

class WeatherAppBar extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherAppBar({
    super.key,
    required this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        "Weather",
        style: TextStyle(
            color: Colors.white, fontSize: 28, fontWeight: FontWeight.w500),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: IconButton(
            onPressed: () {
              context.read<WeatherBloc>().add(WeatherFetched());
            },
            icon: Icon(
              Icons.refresh,
              size: 30,
            ),
          ),
          // child: IconButton(Icons.refresh, color: Colors.white, size: 25),
        )
      ],
      expandedHeight: 650,
      collapsedHeight: 90,
      elevation: 4,
      pinned: true,
      scrolledUnderElevation: 10,
      stretch: true,
      flexibleSpace: WeatherAppFlexibleSpace(
        weatherModel: weatherModel,
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: Container(
          height: 25,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.appBackgroundColorWithWhite,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
                color: Color(0xFFD0DBEA),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
      ),
    );
  }
}
