import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weather/weather_bloc.dart';
import 'package:weather_app_bloc/data/data_provider/weather_data_provider.dart';
import 'package:weather_app_bloc/data/respository/weather_repository.dart';
import 'package:weather_app_bloc/presentation/colors.dart';
import 'package:weather_app_bloc/presentation/widgets/weather_app_bar.dart';
import 'package:weather_app_bloc/presentation/widgets/weather_list_view.dart';

class WeatherPageScreen extends StatefulWidget {
  final String place;
  const WeatherPageScreen({
    super.key,
    required this.place,
  });

  @override
  _WeatherPageScreenState createState() => _WeatherPageScreenState();
}

class _WeatherPageScreenState extends State<WeatherPageScreen> {
  late WeatherRepository _weatherRepository;
  late WeatherBloc _weatherBloc;

  @override
  void initState() {
    super.initState();
    _weatherRepository = WeatherRepository(WeatherDataProvider(), widget.place);
    _weatherBloc = WeatherBloc(_weatherRepository);
    _weatherBloc.add(WeatherFetched());
  }

  @override
  void dispose() {
    _weatherBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: BlocProvider.value(
        value: _weatherBloc,
        child: Scaffold(
          backgroundColor: AppColors.appBackgroundColor,
          body: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
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
        ),
      ),
    );
  }
}
