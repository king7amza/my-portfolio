import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/themes/app_colors.dart';
import 'package:portfolio/features/portfolio/models/nav_bar_tab_model.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
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
                            color: AppColors.white,
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
                color: AppColors.black,
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: navBarTabsList.map((tab) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(tab.name),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
