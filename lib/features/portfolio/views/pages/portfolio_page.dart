import 'package:flutter/material.dart';
import 'package:portfolio/core/themes/app_colors.dart';
import 'package:portfolio/features/portfolio/views/widgets/about_section_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/home_section_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/nav_bar_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/projects_section_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/shadow_1_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/shadow_2_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/skilles_section_widget.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;

    final box = context.findRenderObject() as RenderBox;
    final position = box.localToGlobal(Offset.zero);

    final offset = scrollController.offset + position.dy - 95;

    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    const double designWidth = 360;
    const double designHeight = 800;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(height: 5000, width: double.infinity),
          // shadow1
          Positioned(
            top: 40,
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
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  // home section
                  HomeSectionWidget(homeKey: homeKey, scrollToSection: scrollToSection,navigatorKey: projectsKey,),
                  const SizedBox(height: 100),
                  // about section
                  AboutSectionWidget(aboutKey: aboutKey),
                  const SizedBox(height: 100),
                  // skills section
                  SkillesSectionWidget(skillsKey: skillsKey),
                  const SizedBox(height: 50),
                  // projects section
                  ProjectsSectionWidget(projectsKey: projectsKey),
                ],
              ),
            ),
          ),
          // nav bar
          Positioned(
            top: size.height * (23 / designHeight),
            left: size.width * (20 / designWidth),
            right: size.width * (20 / designWidth),
            child: NavBarWidget(
              homeKey: homeKey,
              aboutKey: aboutKey,
              skillsKey: skillsKey,
              projectsKey: projectsKey,
              scrollToSection: scrollToSection,
            ),
          ),
        ],
      ),
    );
  }
}
