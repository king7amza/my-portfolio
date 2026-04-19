part of 'theme_cubit.dart';

sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class ThemeChanged extends ThemeState {
  final bool isDarkMode;

  ThemeChanged({required this.isDarkMode});
}
