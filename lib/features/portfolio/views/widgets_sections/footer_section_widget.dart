import 'package:flutter/material.dart';

class FooterSectionWidget extends StatelessWidget {
  const FooterSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      // width: size.width,
      height: 240,
      decoration: BoxDecoration(color: colorScheme.outline),
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    color: colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "made by flutter",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: colorScheme.onPrimary,
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
      ),
    );
  }
}
