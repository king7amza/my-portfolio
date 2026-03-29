import 'package:flutter/material.dart';
import 'package:portfolio/core/themes/app_colors.dart';
import 'package:portfolio/features/portfolio/models/skilles_model.dart';
import 'package:portfolio/features/portfolio/views/widgets/about_section_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/home_section_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/nav_bar_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/shadow_1_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/shadow_2_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/skill_card_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/skilles_section_widget.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final homeKey = GlobalKey();
    final aboutKey = GlobalKey();
    final skillsKey = GlobalKey();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(height: 5000, width: double.infinity),
            // shadow1
            Positioned(
              top: 50,
              right: 0,
              width: 400,
              height: 400,
              child: Shadow1Widget(),
            ),
            // shadow2
            Positioned(top: 300, right: 0, child: Shadow2Widget()),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.08,
                right: size.width * 0.08,
                top: size.height * 0.028,
                bottom: size.height * 0.09,
              ),
              child: Column(
                children: [
                  // nav bar
                  NavBarWidget(
                    homeKey: homeKey,
                    aboutKey: aboutKey,
                    skillsKey: skillsKey,
                  ),
                  const SizedBox(height: 40),
                  // home section
                  HomeSectionWidget(homeKey: homeKey),
                ],
              ),
            ),
            // about section
            Positioned(
              top: 600,
              left: size.width * 0.09,
              right: size.width * 0.09,
              child: AboutSectionWidget(aboutKey: aboutKey),
            ),
            // skills section
            Positioned(
              top: 1600,
              left: size.width * 0.09,
              child: SkillesSectionWidget(skillsKey: skillsKey),
            ),
          ],
        ),
      ),
    );
  }
}
