import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_bloc.dart';
import 'package:weather_app_bloc/presentation/colors.dart';
import 'package:weather_app_bloc/presentation/widgets/weather_app_bar.dart';
import 'package:weather_app_bloc/presentation/widgets/weather_list_view.dart';

class WeatherPageScreen extends StatefulWidget {
  const WeatherPageScreen({super.key});

  @override
  _WeatherPageScreenState createState() => _WeatherPageScreenState();
}

class _WeatherPageScreenState extends State<WeatherPageScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(WeatherFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          print(state);
          if (state is WeatherFailure) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(color: Colors.white),
              ),
            );
          } else if (state is! WeatherSuccess) {
            return Center(child: CircularProgressIndicator());
          } else {
            final weatherModel = state.weatherModel;
            return CustomScrollView(slivers: [
              WeatherAppBar(
                weatherModel: weatherModel,
              ),
              WeatherListView(),
            ]);
          }
        },
      ),
    );
  }
}
