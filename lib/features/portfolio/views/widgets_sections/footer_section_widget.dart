import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/features/portfolio/views/widgets/chat_bubble_widget.dart';

class FooterSectionWidget extends StatelessWidget {
  const FooterSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      // width: size.width,
      height: 300,
      decoration: BoxDecoration(color: colorScheme.outline),
      child: Padding(
        padding: const EdgeInsets.only(top: 120.0, bottom: 20.0),
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ChatBubble(
                    message:
                        "my little bird zaghloul is happy to see you here 🐦",
                    isMe: true,
                  ),
                  Lottie.asset(
                    "assets/lottie/zaghloul.json",
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: BorderRadius.circular(
                            size.width * 0.05,
                          ),
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Center(
                              child: Text(
                                "H",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: constraints.maxHeight * 0.4,
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.surfaceBright,
                                    ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Hamza Hossam",
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: colorScheme.surfaceBright,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "made by flutter",
                        style: Theme.of(context).textTheme.labelMedium!
                            .copyWith(
                              color: colorScheme.surfaceBright,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        "assets/images/flutter_logo.png",
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
