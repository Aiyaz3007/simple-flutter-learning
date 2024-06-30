import 'package:flutter/material.dart';
import 'package:weather_app_bloc/presentation/colors.dart';
import 'package:weather_app_bloc/presentation/widgets/weather_list_view_tile.dart';

class WeatherListView extends StatelessWidget {
  const WeatherListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: AppColors.appBackgroundColorWithWhite,
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WeatherListViewTile(
                day: "Tomorrow", celsius: 22, icon: Icons.sunny),
            Divider(
              height: 1,
              color: Colors.blueGrey[50],
            ),
            WeatherListViewTile(day: "Monday", celsius: 22, icon: Icons.sunny),
            Divider(
              height: 1,
              color: Colors.blueGrey[50],
            ),
            WeatherListViewTile(day: "Tuesday", celsius: 22, icon: Icons.sunny),
            Divider(
              height: 1,
              color: Colors.blueGrey[50],
            ),
            WeatherListViewTile(
                day: "Wednesday", celsius: 22, icon: Icons.sunny),
            Divider(
              height: 1,
              color: Colors.blueGrey[50],
            ),
            WeatherListViewTile(
                day: "Thrusday", celsius: 22, icon: Icons.sunny),
            Divider(
              height: 1,
              color: Colors.blueGrey[50],
            ),
            WeatherListViewTile(day: "Friday", celsius: 22, icon: Icons.sunny),
            Divider(
              height: 1,
              color: Colors.blueGrey[50],
            ),
          ],
        ),
      ),
    );
  }
}
