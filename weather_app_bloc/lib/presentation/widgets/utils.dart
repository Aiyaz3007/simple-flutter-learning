import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  // Get the current date
  DateTime now = DateTime.now();

  // Check if the date is today
  bool isToday = now.year == dateTime.year &&
      now.month == dateTime.month &&
      now.day == dateTime.day;

  // Create a DateFormat object for the desired format
  DateFormat dateFormat = DateFormat('MMMM yyyy, hh:mm a');
  String formattedDate = dateFormat.format(dateTime);

  // Add "Today" if the date is today
  if (isToday) {
    formattedDate = 'Today ' + formattedDate;
  }

  return formattedDate;
}

// Function to convert Kelvin to Celsius
double kelvinToCelsius(double kelvin) {
  return roundDecimalPlace(kelvin - 273.15);
}

// Function to round to 1 decimal place
double roundDecimalPlace(double value) {
  return double.parse(value.toStringAsFixed(2));
}
