import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool isDarkMode = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    emit(ThemeChanged(isDarkMode: isDarkMode));
  }
}
