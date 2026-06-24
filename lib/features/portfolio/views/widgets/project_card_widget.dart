import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/features/portfolio/models/projects_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCardWidget extends StatefulWidget {
  final ProjectsModel project;
  const ProjectCardWidget({super.key, required this.project});

  @override
  State<ProjectCardWidget> createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  bool isViewHovered = false;
  bool isCardActive = false;

  void onExitView(PointerExitEvent event) {
    setState(() {
      isViewHovered = false;
    });
  }

  void onEnterView(PointerEnterEvent event) {
    setState(() {
      isViewHovered = true;
    });
  }

  void _setCardActive(bool value) {
    setState(() {
      isCardActive = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setCardActive(true),
      onExit: (_) => _setCardActive(false),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onLongPressStart: (_) => _setCardActive(true),
        onLongPressEnd: (_) => _setCardActive(false),
        onLongPressCancel: () => _setCardActive(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          width: 300,
          height: 400,
          transform: Matrix4.identity()..scale(isCardActive ? 1.03 : 1.0),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            color: colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isCardActive ? 0.16 : 0.08),
                blurRadius: isCardActive ? 20 : 10,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double height = constraints.maxHeight;
              final double width = constraints.maxWidth;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      widget.project.imageUrl,
                      height: height * 0.6,
                      width: width * 0.8,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.project.title,
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(width: 10),
                        MouseRegion(
                          onEnter: onEnterView,
                          onExit: onExitView,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: isViewHovered
                                  ? colorScheme.primary
                                  : colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: colorScheme.primary),
                            ),
                            child: InkWell(
                              onTap: () async {
                                final Uri url = Uri.parse(
                                  widget.project.projectUrl,
                                );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Text(
                                "View",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: isViewHovered
                                          ? colorScheme.onPrimary
                                          : colorScheme.primary,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.project.description,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/features/portfolio/models/projects_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCardWidget extends StatefulWidget {
  final ProjectsModel project;
  const ProjectCardWidget({super.key, required this.project});

  @override
  State<ProjectCardWidget> createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  bool isViewHovered = false;

  void onExitView(PointerExitEvent event) {
    setState(() {
      isViewHovered = false;
    });
  }

  void onEnterView(PointerEnterEvent event) {
    setState(() {
      isViewHovered = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double height = constraints.maxHeight;
          final double width = constraints.maxWidth;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.project.imageUrl,
                  height: height * 0.6,
                  width: width * 0.8,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.project.title,
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(width: 10),
                    MouseRegion(
                      onEnter: onEnterView,
                      onExit: onExitView,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isViewHovered
                              ? colorScheme.primary
                              : colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: colorScheme.primary),
                        ),
                        child: InkWell(
                          onTap: () async {
                            final Uri url = Uri.parse(
                              widget.project.projectUrl,
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Text(
                            "View",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: isViewHovered
                                      ? colorScheme.onPrimary
                                      : colorScheme.primary,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  widget.project.description,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
*/
