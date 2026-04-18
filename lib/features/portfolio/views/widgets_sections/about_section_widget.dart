import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/features/portfolio/views/widgets/about_widget_mobile_view.dart';
import 'package:portfolio/features/portfolio/views/widgets/about_widget_web_view.dart';

class AboutSectionWidget extends StatefulWidget {
  final GlobalKey<State<StatefulWidget>> aboutKey;
  final GlobalKey<State<StatefulWidget>> navigatorKey;
  final Function(GlobalKey) scrollToSection;
  const AboutSectionWidget({
    super.key,
    required this.aboutKey,
    required this.navigatorKey,
    required this.scrollToSection,
  });

  @override
  State<AboutSectionWidget> createState() => _AboutSectionWidgetState();
}

class _AboutSectionWidgetState extends State<AboutSectionWidget> {
  bool isLinkedInHovered = false;
  bool isGitHubHovered = false;

  void onExitLinkedIn(PointerExitEvent event) {
    setState(() {
      isLinkedInHovered = false;
    });
  }

  void onEnterLinkedIn(PointerEnterEvent event) {
    setState(() {
      isLinkedInHovered = true;
    });
  }

  void onExitGitHub(PointerExitEvent event) {
    setState(() {
      isGitHubHovered = false;
    });
  }

  void onEnterGitHub(PointerEnterEvent event) {
    setState(() {
      isGitHubHovered = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return size.width > 600
        ? AboutWidgetWebView(
            aboutKey: widget.aboutKey,
            isLinkedInHovered: isLinkedInHovered,
            onLinkedInEnter: onEnterLinkedIn,
            onLinkedInExit: onExitLinkedIn,
            isGitHubHovered: isGitHubHovered,
            onGitHubEnter: onEnterGitHub,
            onGitHubExit: onExitGitHub,
            scrollToSection: widget.scrollToSection,
            navigatorKey: widget.navigatorKey,
          )
        : AboutWidgetMobileView(
            aboutKey: widget.aboutKey,
            isLinkedInHovered: isLinkedInHovered,
            onLinkedInEnter: onEnterLinkedIn,
            onLinkedInExit: onExitLinkedIn,
            isGitHubHovered: isGitHubHovered,
            onGitHubEnter: onEnterGitHub,
            onGitHubExit: onExitGitHub,
            scrollToSection: widget.scrollToSection,
            navigatorKey: widget.navigatorKey,
          );
  }
}
