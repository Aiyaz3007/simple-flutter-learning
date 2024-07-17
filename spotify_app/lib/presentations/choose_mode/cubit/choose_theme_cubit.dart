import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'choose_theme_state.dart';

class ChooseThemeCubit extends Cubit<ChooseThemeState> {
  ChooseThemeCubit() : super(ChooseThemeInitial());

  void setThemeMode(ThemeMode mode) {
    emit(ChooseThemeChanged(themeMode: mode));
  }

  ThemeMode getThemeMode() {
    final currentState = state;
    if (currentState is ChooseThemeChanged) {
      return currentState.themeMode;
    } else {
      return ThemeMode.system; // default theme mode
    }
  }
}
