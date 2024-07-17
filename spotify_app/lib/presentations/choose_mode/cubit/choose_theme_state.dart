// ignore_for_file: must_be_immutable

part of 'choose_theme_cubit.dart';

@immutable
sealed class ChooseThemeState {
  late ThemeMode? themeMode;
}

final class ChooseThemeInitial extends ChooseThemeState {
  ChooseThemeInitial() {
    super.themeMode = ThemeMode.system;
  }
}

final class ChooseThemeChanged extends ChooseThemeState {
  final ThemeMode themeMode;

  ChooseThemeChanged({required this.themeMode}) {
    super.themeMode = themeMode;
  }
}
