import 'package:flutter/material.dart';

class HomeSectionWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      key: homeKey,
      builder: (context, constraints) {
        return SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello, I'm\nHamza Hossam",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: constraints.maxWidth * 0.06,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSecondary,
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
              const SizedBox(height: 20),
              Text(
                "Flutter Developer",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: constraints.maxWidth * 0.05,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: constraints.maxWidth * 0.8,
                child: Text(
                  "I'm a Flutter developer from Egypt. I have a passion for Flutter and I'm always learning new things. I'm also a self-taught developer and I'm always looking for new challenges.",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: constraints.maxWidth * 0.035,
                    fontWeight: FontWeight.w400,
                    color: colorScheme.onSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  scrollToSection(navigatorKey);
                },
                child: Container(
                  width: constraints.maxWidth * 0.3,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
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
                                color: colorScheme.onPrimary,
                              ),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          color: colorScheme.onPrimary,
                          size: 15,
                        ),
                      ],
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
