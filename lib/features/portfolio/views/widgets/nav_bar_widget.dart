import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/features/portfolio/views/widgets/tag_button_widget.dart';

class NavBarWidget extends StatefulWidget {
  final GlobalKey<State<StatefulWidget>> homeKey;
  final GlobalKey<State<StatefulWidget>> aboutKey;
  final GlobalKey<State<StatefulWidget>> skillsKey;
  const NavBarWidget({
    super.key,
    required this.homeKey,
    required this.aboutKey,
    required this.skillsKey,
  });

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  bool isHovered = false;
  GlobalKey<State<StatefulWidget>> currentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Row(
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
              dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TagButtonWidget(
                          tagName: "Home",
                          selectedKey: widget.homeKey,
                          onTap: () => scrollToSection(widget.homeKey),
                          onEnter: (_) => setState(() {
                            isHovered = true;
                            currentKey = widget.homeKey;
                          }),
                          onExit: (_) => setState(() => isHovered = false),
                          isHovered: isHovered && currentKey == widget.homeKey,
                        ),
                        TagButtonWidget(
                          tagName: "About",
                          selectedKey: widget.aboutKey,
                          onTap: () => scrollToSection(widget.aboutKey),
                          onEnter: (_) => setState(() {
                            isHovered = true;
                            currentKey = widget.aboutKey;
                          }),
                          onExit: (_) => setState(() => isHovered = false),
                          isHovered: isHovered && currentKey == widget.aboutKey,
                        ),
                        TagButtonWidget(
                          tagName: "Skills",
                          selectedKey: widget.skillsKey,
                          onTap: () => scrollToSection(widget.skillsKey),
                          onEnter: (_) => setState(() {
                            isHovered = true;
                            currentKey = widget.skillsKey;
                          }),
                          onExit: (_) => setState(() => isHovered = false),
                          isHovered:
                              isHovered && currentKey == widget.skillsKey,
                        ),
                        // TextButton(
                        //   onPressed: () => scrollToSection(aboutKey),
                        //   child: Text("Projects"),
                        // ),
                        // TextButton(
                        //   onPressed: () => scrollToSection(homeKey),
                        //   child: Text("Contact"),
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
