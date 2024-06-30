import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app_bloc/data/respository/weather_repository.dart';
import 'package:weather_app_bloc/model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetched>(_getCurrentWeather);
  }

  void _getCurrentWeather(
    WeatherFetched event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    try {
      final weatherModel = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weatherModel));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
