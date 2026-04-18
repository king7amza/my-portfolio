import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/features/portfolio/views/widgets/tag_button_widget.dart';

class NavBarWidget extends StatefulWidget {
  final int activeIndex;
  final GlobalKey<State<StatefulWidget>> homeKey;
  final GlobalKey<State<StatefulWidget>> aboutKey;
  final GlobalKey<State<StatefulWidget>> skillsKey;
  final GlobalKey<State<StatefulWidget>> projectsKey;
  final GlobalKey<State<StatefulWidget>> contactKey;
  final Function(GlobalKey) scrollToSection;
  const NavBarWidget({
    super.key,
    required this.activeIndex,
    required this.homeKey,
    required this.aboutKey,
    required this.skillsKey,
    required this.scrollToSection,
    required this.projectsKey,
    required this.contactKey,
  });

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  final ScrollController navController = ScrollController();
  void _scrollToActive(int index) {
    const itemWidth = 70.0;
    navController.animateTo(
      index * itemWidth,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  void didUpdateWidget(covariant NavBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToActive(widget.activeIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorScheme.primary, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(size.width * 0.05),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Center(
                        child: Text(
                          "H",
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(
                                fontSize: constraints.maxHeight * 0.4,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onPrimary,
                              ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "Hamza Hossam",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: size.width > 600
                        ? 20
                        : size.width * 0.035,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.touch,
                  },
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      controller: navController,
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: constraints.maxWidth,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TagButtonWidget(
                              tagName: "Home",
                              isSelected: widget.activeIndex == 0,
                              onTap: () =>
                                  widget.scrollToSection(widget.homeKey),
                            ),
                            TagButtonWidget(
                              tagName: "About",
                              isSelected: widget.activeIndex == 1,
                              onTap: () =>
                                  widget.scrollToSection(widget.aboutKey),
                            ),
                            TagButtonWidget(
                              tagName: "Skills",
                              isSelected: widget.activeIndex == 2,
                              onTap: () =>
                                  widget.scrollToSection(widget.skillsKey),
                            ),
                            TagButtonWidget(
                              tagName: "Projects",
                              isSelected: widget.activeIndex == 3,
                              onTap: () =>
                                  widget.scrollToSection(widget.projectsKey),
                            ),
                            TagButtonWidget(
                              tagName: "Contact",
                              isSelected: widget.activeIndex == 4,
                              onTap: () =>
                                  widget.scrollToSection(widget.contactKey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
