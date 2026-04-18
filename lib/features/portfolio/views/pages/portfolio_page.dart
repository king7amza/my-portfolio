import 'package:flutter/material.dart';
import 'package:portfolio/core/themes/app_colors.dart';
import 'package:portfolio/features/portfolio/views/widgets_sections/about_section_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets_sections/contact_section_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets_sections/footer_section_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets_sections/home_section_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets_sections/nav_bar_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets_sections/projects_section_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/shadow_1_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/shadow_2_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets_sections/skilles_section_widget.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final home = GlobalKey<State<StatefulWidget>>();
  final about = GlobalKey<State<StatefulWidget>>();
  final skills = GlobalKey<State<StatefulWidget>>();
  final projects = GlobalKey<State<StatefulWidget>>();
  final contact = GlobalKey<State<StatefulWidget>>();
  late final ScrollController scrollController;
  List<GlobalKey<State<StatefulWidget>>> keysList = [];
  List<double> offsets = [];
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    keysList = [home, about, skills, projects, contact];
    scrollController = ScrollController();
    scrollController.addListener(() {
      final offset = scrollController.offset;
      for (int i = 0; i < offsets.length; i++) {
        final start = offsets[i];
        final end = (i == offsets.length - 1)
            ? double.infinity
            : offsets[i + 1];
        if (offset >= start && offset < end) {
          if (activeIndex != i) {
            setState(() {
              activeIndex = i;
            });
          }
          break;
        }
      }
    });
  }

  @override
  void didUpdateWidget(PortfolioPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    calculateOffsets();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void calculateOffsets() {
    offsets = keysList.map((key) {
      final context = key.currentContext;
      if (context == null) return 0.0;
      final box = context.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero);
      return scrollController.offset + position.dy - 90;
    }).toList();
  }

  void scrollToSection(GlobalKey key) {
    final offset = offsets[keysList.indexOf(key)];
    final context = key.currentContext;
    if (context == null) return;
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      calculateOffsets();
    });
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(height: 4000, width: double.infinity),
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
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    top: size.height * 0.028,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      // home section
                      HomeSectionWidget(
                        homeKey: keysList[0],
                        scrollToSection: scrollToSection,
                        navigatorKey: keysList[3],
                      ),
                      const SizedBox(height: 100),
                      // about section
                      AboutSectionWidget(
                        aboutKey: keysList[1],
                        navigatorKey: keysList[4],
                        scrollToSection: scrollToSection,
                      ),
                      const SizedBox(height: 100),
                      // skills section
                      SkillesSectionWidget(skillsKey: keysList[2]),
                      const SizedBox(height: 50),
                      // projects section
                      ProjectsSectionWidget(projectsKey: keysList[3]),
                    ],
                  ),
                ),
                // contact section
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      bottom: -170,
                      right: 0,
                      left: 0,
                      child: FooterSectionWidget(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.03,
                        right: size.width * 0.03,
                        top: size.height * 0.028,
                      ),
                      child: ContactSectionWidget(contactKey: keysList[4]),
                    ),
                  ],
                ),
                const SizedBox(height: 170),
              ],
            ),
          ),
          // nav bar
          Positioned(
            top: size.height * (23 / designHeight),
            left: size.width * (20 / designWidth),
            right: size.width * (20 / designWidth),
            child: NavBarWidget(
              activeIndex: activeIndex,
              homeKey: keysList[0],
              aboutKey: keysList[1],
              skillsKey: keysList[2],
              projectsKey: keysList[3],
              contactKey: keysList[4],
              scrollToSection: scrollToSection,
            ),
          ),
        ],
      ),
    );
  }
}
