import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/features/portfolio/views/widgets/tag_button_widget.dart';

class NavBarWidget extends StatefulWidget {
  final GlobalKey<State<StatefulWidget>> homeKey;
  final GlobalKey<State<StatefulWidget>> aboutKey;
  final GlobalKey<State<StatefulWidget>> skillsKey;
  final GlobalKey<State<StatefulWidget>> projectsKey;
  final Function(GlobalKey) scrollToSection;
  const NavBarWidget({
    super.key,
    required this.homeKey,
    required this.aboutKey,
    required this.skillsKey,
    required this.scrollToSection,
    required this.projectsKey,
  });

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  // void scrollToSection(GlobalKey key) {
  //   Scrollable.ensureVisible(
  //     key.currentContext!,
  //     duration: Duration(milliseconds: 500),
  //     curve: Curves.easeInOut,
  //   );
  // }

  bool isHovered = false;
  bool isSelected = false;
  GlobalKey<State<StatefulWidget>> selectedKey = GlobalKey();
  GlobalKey<State<StatefulWidget>> hoverdKey = GlobalKey();
  // @override
  // void initState() {
  //   super.initState();
  //   currentKey = widget.skillsKey;
  // }

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
                    fontSize: 20,
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
                              selectedKey: widget.homeKey,
                              hoverdKey: widget.homeKey,
                              onTap: () {
                                widget.scrollToSection(widget.homeKey);
                                setState(() {
                                  isSelected = true;
                                  selectedKey = widget.homeKey;
                                });
                              },
                              isSelected:
                                  isSelected && selectedKey == widget.homeKey,
                              onEnter: (_) => setState(() {
                                isHovered = true;
                                hoverdKey = widget.homeKey;
                              }),
                              onExit: (_) => setState(() => isHovered = false),
                              isHovered:
                                  isHovered && hoverdKey == widget.homeKey,
                            ),
                            TagButtonWidget(
                              tagName: "About",
                              selectedKey: widget.aboutKey,
                              hoverdKey: widget.aboutKey,
                              onTap: () {
                                widget.scrollToSection(widget.aboutKey);
                                setState(() {
                                  isSelected = true;
                                  selectedKey = widget.aboutKey;
                                });
                              },
                              isSelected:
                                  isSelected && selectedKey == widget.aboutKey,
                              onEnter: (_) => setState(() {
                                isHovered = true;
                                hoverdKey = widget.aboutKey;
                              }),
                              onExit: (_) => setState(() => isHovered = false),
                              isHovered:
                                  isHovered && hoverdKey == widget.aboutKey,
                            ),
                            TagButtonWidget(
                              tagName: "Skills",
                              selectedKey: widget.skillsKey,
                              hoverdKey: widget.skillsKey,
                              onTap: () {
                                widget.scrollToSection(widget.skillsKey);
                                setState(() {
                                  isSelected = true;
                                  selectedKey = widget.skillsKey;
                                });
                              },
                              isSelected:
                                  isSelected && selectedKey == widget.skillsKey,
                              onEnter: (_) => setState(() {
                                isHovered = true;
                                hoverdKey = widget.skillsKey;
                              }),
                              onExit: (_) => setState(() => isHovered = false),
                              isHovered:
                                  isHovered && hoverdKey == widget.skillsKey,
                            ),
                            TagButtonWidget(
                              tagName: "Projects",
                              selectedKey: widget.projectsKey,
                              hoverdKey: widget.projectsKey,
                              onTap: () {
                                widget.scrollToSection(widget.projectsKey);
                                setState(() {
                                  isSelected = true;
                                  selectedKey = widget.projectsKey;
                                });
                              },
                              isSelected:
                                  isSelected &&
                                  selectedKey == widget.projectsKey,
                              onEnter: (_) => setState(() {
                                isHovered = true;
                                hoverdKey = widget.projectsKey;
                              }),
                              onExit: (_) => setState(() => isHovered = false),
                              isHovered:
                                  isHovered && hoverdKey == widget.projectsKey,
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
