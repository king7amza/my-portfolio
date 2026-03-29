import 'package:flutter/material.dart';
import 'package:portfolio/core/app_constents.dart';
import 'package:portfolio/core/themes/app_themes.dart';
import 'package:portfolio/features/portfolio/views/pages/portfolio_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*
  home done
  about done
  skills done
  projects
  contact
  */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstents.appName,
      theme: AppThemes.lightTheme,
      home: const PortfolioPage(),
    );
  }
}
