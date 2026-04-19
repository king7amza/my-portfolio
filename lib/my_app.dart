import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/app_constents.dart';
import 'package:portfolio/core/themes/app_themes.dart';
import 'package:portfolio/features/portfolio/view_models/theme_cubit/theme_cubit.dart';
import 'package:portfolio/features/portfolio/views/pages/portfolio_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*
  home done
  about done
  skills done
  download cv
  projects
  contact
  */
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        buildWhen: (previous, current) =>
            current is ThemeChanged || current is ThemeInitial,
        builder: (context, state) {
          if (state is ThemeChanged) {
            final bool isDarkMode = state.isDarkMode;
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppConstents.appName,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
              home: const PortfolioPage(),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppConstents.appName,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: ThemeMode.light,
            home: const PortfolioPage(),
          );
        },
      ),
    );
  }
}

//ThemeMode.system
