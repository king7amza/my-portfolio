import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/features/portfolio/services/adupter_palteforms_services.dart';

class HomeSectionWidget extends StatefulWidget {
  final GlobalKey<State<StatefulWidget>> homeKey;
  final GlobalKey<State<StatefulWidget>> navigatorKey;
  final Function(GlobalKey) scrollToSection;
  const HomeSectionWidget({
    super.key,
    required this.homeKey,
    required this.scrollToSection,
    required this.navigatorKey,
  });

  @override
  State<HomeSectionWidget> createState() => _HomeSectionWidgetState();
}

class _HomeSectionWidgetState extends State<HomeSectionWidget> {
  bool isProjectsHovered = false;

  void onExitProjects(PointerExitEvent event) {
    setState(() {
      isProjectsHovered = false;
    });
  }

  void onEnterProjects(PointerEnterEvent event) {
    setState(() {
      isProjectsHovered = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      key: widget.homeKey,
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        return SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width > 600 ? width * 0.5 : width * 0.5,
                    child: Text(
                      "Hello, I'm\nHamza Hossam",
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(
                            fontSize: width > 600 ? width * 0.05 : 30,
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onSecondary,
                          ),
                    ),
                  ),
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: [colorScheme.primary, colorScheme.onSecondary],
                      ).createShader(bounds);
                    },
                    child: Text(
                      "Flutter\nDeveloper",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: size.width < 600
                            ? /*26 or 30*/ constraints.maxWidth * 0.08
                            : constraints.maxWidth * 0.1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Flutter Developer",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: width > 600 ? width * 0.03 : 20,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: width > 600 ? width * 0.5 : width * 0.6,
                child: Text(
                  "I'm a Flutter developer from Egypt. I have a passion for Flutter and I'm always learning new things. I'm also a self-taught developer and I'm always looking for new challenges.",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: width > 600 ? width * 0.02 : 16,
                    fontWeight: FontWeight.w400,
                    color: colorScheme.onSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              MouseRegion(
                onEnter: onEnterProjects,
                onExit: onExitProjects,
                child: InkWell(
                  onTap: () {
                    widget.scrollToSection(widget.navigatorKey);
                  },
                  child: AnimatedContainer(
                    width: 120,
                    height: 40,
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: AdupterPalteformsServices.isMobile()
                          ? (colorScheme.primary)
                          : (isProjectsHovered
                                ? colorScheme.primary
                                : colorScheme.onPrimary),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: colorScheme.primary),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Projects",
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: AdupterPalteformsServices.isMobile()
                                      ? (colorScheme.onPrimary)
                                      : (isProjectsHovered
                                            ? colorScheme.onPrimary
                                            : colorScheme.primary),
                                ),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: AdupterPalteformsServices.isMobile()
                                ? (colorScheme.onPrimary)
                                : (isProjectsHovered
                                      ? colorScheme.onPrimary
                                      : colorScheme.primary),
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
