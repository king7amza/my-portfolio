import 'package:flutter/material.dart';
import 'package:portfolio/core/app_constents.dart';
import 'package:portfolio/features/portfolio/views/pages/portfolio_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstents.appName,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PortfolioPage(),
    );
  }
}
