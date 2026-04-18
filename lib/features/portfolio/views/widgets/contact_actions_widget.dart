import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/features/portfolio/services/adupter_palteforms_services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactActionsWidget extends StatefulWidget {
  final double contactAction1Height;
  final double contactAction1Width;
  final double contactAction1FontSize;
  final double contactAction2Height;
  final double contactAction2Width;
  final double contactAction2FontSize;
  final double contactAction2IconSize;
  final Function(GlobalKey) scrollToSection;
  final GlobalKey<State<StatefulWidget>> navigatorKey;
  const ContactActionsWidget({
    super.key,
    required this.contactAction1Height,
    required this.contactAction1Width,
    required this.contactAction1FontSize,
    required this.contactAction2Height,
    required this.contactAction2Width,
    required this.contactAction2FontSize,
    required this.contactAction2IconSize,
    required this.scrollToSection,
    required this.navigatorKey,
  });

  @override
  State<ContactActionsWidget> createState() => _ContactActionsWidgetState();
}

class _ContactActionsWidgetState extends State<ContactActionsWidget> {
  bool isCVHovered = false;
  bool isGetInTouchHovered = false;

  void onExitCV(PointerExitEvent event) {
    setState(() {
      isCVHovered = false;
    });
  }

  void onEnterCV(PointerEnterEvent event) {
    setState(() {
      isCVHovered = true;
    });
  }

  void onExitGetInTouch(PointerExitEvent event) {
    setState(() {
      isGetInTouchHovered = false;
    });
  }

  void onEnterGetInTouch(PointerEnterEvent event) {
    setState(() {
      isGetInTouchHovered = true;
    });
  }

  Future<void> _launchCV() async {
    final Uri cvUrl = Uri.parse(
      'https://drive.google.com/uc?export=download&id=1sXHnAcuG8iUzcF0vMmXHxrRjt5y6tHHd',
    );
    await launchUrl(cvUrl, mode: LaunchMode.externalApplication);
    // if (!await launchUrl(cvUrl, mode: LaunchMode.externalApplication)) {
    // if (mounted) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('')),
    //   );
    // }
    // }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MouseRegion(
          onEnter: onEnterGetInTouch,
          onExit: onExitGetInTouch,
          child: InkWell(
            onTap: () {
              widget.scrollToSection(widget.navigatorKey);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: widget.contactAction1Width,
              height: widget.contactAction1Height,
              decoration: BoxDecoration(
                color: AdupterPalteformsServices.isMobile()
                    ? (colorScheme.primary)
                    : (isGetInTouchHovered
                          ? colorScheme.primary
                          : colorScheme.onPrimary),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: colorScheme.primary),
              ),
              child: Center(
                child: Text(
                  "Get In Touch",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: widget.contactAction1FontSize,
                    fontWeight: FontWeight.w600,
                    color: AdupterPalteformsServices.isMobile()
                        ? (colorScheme.onPrimary)
                        : (isGetInTouchHovered
                              ? colorScheme.onPrimary
                              : colorScheme.primary),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        MouseRegion(
          onEnter: onEnterCV,
          onExit: onExitCV,
          child: InkWell(
            onTap: () async {
              await _launchCV();
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: widget.contactAction2Width,
              height: widget.contactAction2Height,
              decoration: BoxDecoration(
                color: isCVHovered
                    ? colorScheme.primary
                    : colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: colorScheme.primary),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Download CV",
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(
                            fontSize: widget.contactAction2FontSize,
                            fontWeight: FontWeight.w600,
                            color: isCVHovered
                                ? colorScheme.onPrimary
                                : colorScheme.primary,
                          ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.download_outlined,
                      color: isCVHovered
                          ? colorScheme.onPrimary
                          : colorScheme.primary,
                      size: widget.contactAction2IconSize,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
