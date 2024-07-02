import 'package:flutter/material.dart';

class WeatherHomePageListView extends StatelessWidget {
  final String place;
  final double celius = 28.0;

  static Color mainWidgetColor = Color.fromRGBO(55, 160, 246, 1);
  static Color subWidgetColor = Color.fromRGBO(12, 104, 179, 1);

  static Color mainWidgetColorOnSelected = Color.fromRGBO(28, 86, 137, 1);

  static Color textColor = Colors.white;
  static TextStyle textStyle =
      TextStyle(color: textColor, fontFamily: 'Belleza', fontSize: 24);
  final bool isSelected;

  const WeatherHomePageListView({
    super.key,
    required this.place,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: isSelected ? mainWidgetColorOnSelected : mainWidgetColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            height: 50,
            width: 200,
            decoration: BoxDecoration(
                color: subWidgetColor, borderRadius: BorderRadius.circular(20)),
            child: Text(place, style: textStyle),
          ),
          Container(
            decoration: BoxDecoration(
                color: subWidgetColor, borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.center,
            height: 50,
            width: 100,
            child: Text("${celius.toInt()}°C", style: textStyle),
          )
        ],
      ),
    );
  }
}
