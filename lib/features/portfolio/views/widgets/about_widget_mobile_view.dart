import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/features/portfolio/views/widgets/contact_actions_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWidgetMobileView extends StatefulWidget {
  final GlobalKey aboutKey;
  final bool isLinkedInHovered;
  final bool isGitHubHovered;
  final Function(GlobalKey) scrollToSection;
  final GlobalKey<State<StatefulWidget>> navigatorKey;
  final void Function(PointerEnterEvent) onLinkedInEnter;
  final void Function(PointerExitEvent) onLinkedInExit;
  final void Function(PointerEnterEvent) onGitHubEnter;
  final void Function(PointerExitEvent) onGitHubExit;
  const AboutWidgetMobileView({
    super.key,
    required this.isLinkedInHovered,
    required this.isGitHubHovered,
    required this.aboutKey,
    required this.onLinkedInEnter,
    required this.onLinkedInExit,
    required this.onGitHubEnter,
    required this.onGitHubExit,
    required this.scrollToSection,
    required this.navigatorKey,
  });

  @override
  State<AboutWidgetMobileView> createState() => _AboutWidgetMobileViewState();
}

class _AboutWidgetMobileViewState extends State<AboutWidgetMobileView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      key: widget.aboutKey,
      children: [
        Text(
          "About Me",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontSize: size.width * 0.07,
            fontWeight: FontWeight.w700,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 20),
        AspectRatio(
          aspectRatio: 9 / 16,
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 25,
                bottom: 25,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                constraints.maxWidth,
                              ),
                              child: Image.asset(
                                "assets/images/profile_image.jpeg",
                                width: constraints.maxWidth * 0.55,
                                height: constraints.maxHeight * 0.3,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: constraints.maxWidth * 0.5,
                              height: constraints.maxHeight * 0.1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MouseRegion(
                                      onEnter: widget.onLinkedInEnter,
                                      onExit: widget.onLinkedInExit,
                                      child: InkWell(
                                        onTap: () async {
                                          final Uri url = Uri.parse(
                                            "https://www.linkedin.com/in/hamza-hossam-75b4a1288/",
                                          );
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          width: constraints.maxWidth * 0.15,
                                          height: constraints.maxHeight * 0.1,
                                          decoration: BoxDecoration(
                                            color: widget.isLinkedInHovered
                                                ? colorScheme.primary
                                                : colorScheme.onPrimary,
                                            borderRadius: BorderRadius.circular(
                                              constraints.maxWidth * 0.01,
                                            ),
                                            border: Border.all(
                                              color: colorScheme.primary,
                                              width: 2,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "in",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall!
                                                  .copyWith(
                                                    fontSize:
                                                        constraints.maxHeight *
                                                        0.06,
                                                    fontWeight: FontWeight.w800,
                                                    color:
                                                        widget.isLinkedInHovered
                                                        ? colorScheme.onPrimary
                                                        : colorScheme.primary,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    MouseRegion(
                                      onEnter: widget.onGitHubEnter,
                                      onExit: widget.onGitHubExit,
                                      child: AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: InkWell(
                                          onTap: () async {
                                            final Uri url = Uri.parse(
                                              "https://github.com/king7amza",
                                            );
                                            if (await canLaunchUrl(url)) {
                                              await launchUrl(url);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                          child: AnimatedContainer(
                                            duration: Duration(
                                              milliseconds: 200,
                                            ),
                                            decoration: BoxDecoration(
                                              color: widget.isGitHubHovered
                                                  ? colorScheme.primary
                                                  : colorScheme.onPrimary,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    constraints.maxWidth * 0.01,
                                                  ),
                                              border: Border.all(
                                                color: colorScheme.primary,
                                                width: 2,
                                              ),
                                            ),
                                            child: FractionallySizedBox(
                                              widthFactor: 0.8,
                                              heightFactor: 0.8,
                                              child: Image.asset(
                                                "assets/images/github_icon.png",
                                                color: widget.isGitHubHovered
                                                    ? colorScheme.onPrimary
                                                    : colorScheme.primary,
                                                width:
                                                    constraints.maxWidth * 0.9,
                                                height:
                                                    constraints.maxHeight * 0.9,
                                                fit: BoxFit.cover,
                                                colorBlendMode: BlendMode.srcIn,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello, I'm\nHamza Hossam \nFlutter Developer",
                              style: Theme.of(context).textTheme.headlineSmall!
                                  .copyWith(
                                    fontSize: constraints.maxHeight * 0.04,
                                    fontWeight: FontWeight.w700,
                                    color: colorScheme.onSecondary,
                                  ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: constraints.maxWidth * 0.9,
                              child: Text(
                                'i am a flutter developer Loream ipsum dolor\nsit amet consectetur adipiscing elit.\nUt elit tellus luctus nec ullamcorper mattis pulvinar dui. ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: constraints.maxHeight * 0.026,
                                      fontWeight: FontWeight.w400,
                                      color: colorScheme.secondary,
                                    ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ContactActionsWidget(
                              contactAction1Height:
                                  constraints.maxHeight * 0.07,
                              contactAction1Width: constraints.maxWidth * 0.25,
                              contactAction1FontSize:
                                  constraints.maxHeight * 0.017,
                              contactAction2Height:
                                  constraints.maxHeight * 0.07,
                              contactAction2Width: constraints.maxWidth * 0.29,
                              contactAction2FontSize:
                                  constraints.maxHeight * 0.017,
                              contactAction2IconSize:
                                  constraints.maxHeight * 0.024,
                              scrollToSection: widget.scrollToSection,
                              navigatorKey: widget.navigatorKey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
