import 'package:flutter/material.dart';
import 'package:portfolio/features/portfolio/models/skilles_model.dart';

class SkillCardWidget extends StatelessWidget {
  final SkillesModel skill;
  const SkillCardWidget({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;
        final double maxHeight = constraints.maxHeight;
        return Container(
          decoration: BoxDecoration(
            color: colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "${skill.imagePath1}",
                  height: maxWidth * 0.3,
                  width: maxWidth * 0.3,
                  fit: BoxFit.cover,
                ),
                 SizedBox(height: maxHeight * 0.05),
                Text(
                  skill.title!,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: maxWidth * 0.12,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                 SizedBox(height: maxHeight * 0.02),
                Text(
                  skill.description!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: maxWidth * 0.08,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  softWrap: true,
                  maxLines: null,
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
