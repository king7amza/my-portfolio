import 'package:flutter/material.dart';
import 'package:portfolio/core/app_constents.dart';
import 'package:portfolio/features/portfolio/views/pages/portfolio_page.dart';
import 'package:portfolio/features/portfolio/views/pages/portfolio_stack.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*
  home
  about
  education
  projects
  contact
  skills
  */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstents.appName,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PrtfolioStack(),
    );
  }
}
