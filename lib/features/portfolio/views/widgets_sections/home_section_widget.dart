import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/features/portfolio/views/widgets/toggle_mode_button_widget.dart';

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

  // Typing effect
  Timer? _typingTimer;
  final String _fullText = "Mobile\nDeveloper";
  String _displayedText = "";
  int _charIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), _startTyping);
  }

  void _startTyping() {
    _typingTimer = Timer.periodic(const Duration(milliseconds: 80), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_charIndex < _fullText.length) {
        setState(() {
          _charIndex++;
          _displayedText = _fullText.substring(0, _charIndex);
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    super.dispose();
  }

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
              const SizedBox(height: 70),
              Align(
                alignment: Alignment.topRight,
                child: const ToggleModeButtonWidget(),
              ),
              const SizedBox(height: 10),
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _displayedText,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: size.width < 600
                                    ? constraints.maxWidth * 0.08
                                    : constraints.maxWidth * 0.1,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        if (_charIndex < _fullText.length)
                          _BlinkingCursor(
                            fontSize: size.width < 600
                                ? constraints.maxWidth * 0.08
                                : constraints.maxWidth * 0.1,
                          ),
                      ],
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
                      color: size.width < 600
                          ? colorScheme.primary
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
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: size.width < 600
                                      ? colorScheme.onPrimary
                                      : (isProjectsHovered
                                          ? colorScheme.onPrimary
                                          : colorScheme.primary),
                                ),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: size.width < 600
                                ? colorScheme.onPrimary
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

class _BlinkingCursor extends StatefulWidget {
  final double fontSize;
  const _BlinkingCursor({required this.fontSize});

  @override
  State<_BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<_BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
    _opacity = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: Text(
        "|",
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w300,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/features/portfolio/views/widgets/toggle_mode_button_widget.dart';

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
              const SizedBox(height: 70),
              Align(
                alignment: Alignment.topRight,
                child: const ToggleModeButtonWidget()),
              const SizedBox(height: 10),
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
                      "Mobile\nDeveloper",
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
                      color: size.width < 600
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
                                  color: size.width < 600
                                      ? (colorScheme.onPrimary)
                                      : (isProjectsHovered
                                            ? colorScheme.onPrimary
                                            : colorScheme.primary),
                                ),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: size.width < 600
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
 */