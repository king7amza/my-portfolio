import 'package:flutter/material.dart';
import 'package:portfolio/core/themes/app_colors.dart';
import 'package:portfolio/features/portfolio/views/widgets/contact_actions_widget.dart';

class AboutSectionWidget extends StatelessWidget {
  final GlobalKey<State<StatefulWidget>> aboutKey;
  const AboutSectionWidget({super.key, required this.aboutKey});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return size.width > 600
        ? Column(
            key: aboutKey,
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
                aspectRatio: 16 / 9,
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
                          constraints: BoxConstraints(
                            minWidth: constraints.maxWidth,
                          ),
                          child: Row(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      constraints.maxWidth * 0.05,
                                    ),
                                    child: Image.asset(
                                      "assets/images/profile_image.jpeg",
                                      width: constraints.maxWidth * 0.4,
                                      height: constraints.maxHeight,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: constraints.maxWidth * 0.04,
                                    child: Container(
                                      width: constraints.maxWidth * 0.32,
                                      height: constraints.maxHeight * 0.17,
                                      decoration: BoxDecoration(
                                        color: colorScheme.onPrimary,
                                        borderRadius: BorderRadius.circular(
                                          constraints.maxWidth * 0.01,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "in",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall!
                                                  .copyWith(
                                                    fontSize:
                                                        constraints.maxHeight *
                                                        0.08,
                                                    fontWeight: FontWeight.w800,
                                                    color: colorScheme.primary,
                                                  ),
                                            ),
                                            AspectRatio(
                                              aspectRatio: 1 / 1,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: colorScheme.onPrimary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        constraints.maxWidth *
                                                            0.01,
                                                      ),
                                                ),
                                                child: FractionallySizedBox(
                                                  widthFactor: 0.8,
                                                  heightFactor: 0.8,
                                                  child: Image.asset(
                                                    "assets/images/github_icon.png",
                                                    color: colorScheme.primary,
                                                    width:
                                                        constraints.maxWidth *
                                                        0.9,
                                                    height:
                                                        constraints.maxHeight *
                                                        0.9,
                                                    fit: BoxFit.cover,
                                                    colorBlendMode:
                                                        BlendMode.srcIn,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: size.width * 0.03),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hello, I'm\nHamza Hossam \nFlutter Developer",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontSize:
                                              constraints.maxHeight * 0.09,
                                          fontWeight: FontWeight.w700,
                                          color: colorScheme.onSecondary,
                                        ),
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth * 0.5,
                                    child: Text(
                                      'i am a flutter developer Loream ipsum dolor\nsit amet consectetur adipiscing elit.\nUt elit tellus luctus nec ullamcorper mattis pulvinar dui. ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            fontSize:
                                                constraints.maxHeight * 0.06,
                                            fontWeight: FontWeight.w400,
                                            color: colorScheme.secondary,
                                          ),
                                    ),
                                  ),
                                  ContactActionsWidget(
                                    contactAction1Height:
                                        constraints.maxHeight * 0.13,
                                    contactAction1Width:
                                        constraints.maxWidth * 0.25,
                                    contactAction1FontSize:
                                        constraints.maxHeight * 0.05,
                                    contactAction2Height:
                                        constraints.maxHeight * 0.13,
                                    contactAction2Width:
                                        constraints.maxWidth * 0.25,
                                    contactAction2FontSize:
                                        constraints.maxHeight * 0.05,
                                    contactAction2IconSize:
                                        constraints.maxHeight * 0.05,
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
          )
        : Column(
            key: aboutKey,
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
                          constraints: BoxConstraints(
                            minWidth: constraints.maxWidth,
                          ),
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
                                  Container(
                                    width: constraints.maxWidth * 0.5,
                                    height: constraints.maxHeight * 0.1,
                                    decoration: BoxDecoration(
                                      color: AppColors.lightGrey1,
                                      borderRadius: BorderRadius.circular(
                                        constraints.maxWidth * 0.01,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "in",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .copyWith(
                                                  fontSize:
                                                      constraints.maxHeight *
                                                      0.06,
                                                  fontWeight: FontWeight.w800,
                                                  color: colorScheme.primary,
                                                ),
                                          ),
                                          AspectRatio(
                                            aspectRatio: 1 / 1,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppColors.lightGrey1,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      constraints.maxWidth *
                                                          0.01,
                                                    ),
                                              ),
                                              child: FractionallySizedBox(
                                                widthFactor: 0.8,
                                                heightFactor: 0.8,
                                                child: Image.asset(
                                                  "assets/images/github_icon.png",
                                                  color: colorScheme.primary,
                                                  width:
                                                      constraints.maxWidth *
                                                      0.9,
                                                  height:
                                                      constraints.maxHeight *
                                                      0.9,
                                                  fit: BoxFit.cover,
                                                  colorBlendMode:
                                                      BlendMode.srcIn,
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontSize:
                                              constraints.maxHeight * 0.04,
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
                                            fontSize:
                                                constraints.maxHeight * 0.026,
                                            fontWeight: FontWeight.w400,
                                            color: colorScheme.secondary,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  ContactActionsWidget(
                                    contactAction1Height:
                                        constraints.maxHeight * 0.07,
                                    contactAction1Width:
                                        constraints.maxWidth * 0.25,
                                    contactAction1FontSize:
                                        constraints.maxHeight * 0.017,
                                    contactAction2Height:
                                        constraints.maxHeight * 0.07,
                                    contactAction2Width:
                                        constraints.maxWidth * 0.29,
                                    contactAction2FontSize:
                                        constraints.maxHeight * 0.017,
                                    contactAction2IconSize:
                                        constraints.maxHeight * 0.024,
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
