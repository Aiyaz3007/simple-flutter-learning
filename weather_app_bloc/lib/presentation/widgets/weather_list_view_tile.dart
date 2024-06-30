import 'package:flutter/material.dart';

class WeatherListViewTile extends StatelessWidget {
  final String day;
  final int celsius;
  final IconData icon;

  static const double fontSize = 18;
  static const FontWeight fontWeight = FontWeight.w500;
  static const Color iconColor = Colors.yellow;

  const WeatherListViewTile(
      {super.key,
      required this.day,
      required this.celsius,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(day,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: fontWeight)),
            Text("${celsius.toString()}°C",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: fontWeight)),
          ],
        ),
        trailing: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
