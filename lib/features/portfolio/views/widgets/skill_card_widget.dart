import 'package:flutter/material.dart';
import 'package:portfolio/features/portfolio/models/skilles_model.dart';

class SkillCardWidget extends StatelessWidget {
  final SkillesModel skill;
  const SkillCardWidget({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "${skill.imagePath1}",
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              skill.title!,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              skill.description!,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 14,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
