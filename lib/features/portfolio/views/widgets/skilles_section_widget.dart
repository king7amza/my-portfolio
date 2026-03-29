import 'package:flutter/material.dart';
import 'package:portfolio/features/portfolio/models/skilles_model.dart';
import 'package:portfolio/features/portfolio/views/widgets/skill_card_widget.dart';

class SkillesSectionWidget extends StatelessWidget {
  final GlobalKey<State<StatefulWidget>> skillsKey;
  const SkillesSectionWidget({super.key, required this.skillsKey});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          key: skillsKey,
          "Skills",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontSize: size.width * 0.07,
            fontWeight: FontWeight.w700,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 1500,
          width: size.width * 0.82,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1/1.2,
            ),
            itemCount: skillsList.length,
            itemBuilder: (context, index) {
              final skill = skillsList[index];
              return SkillCardWidget(skill: skill);
            },
          ),
        ),
      ],
    );
  }
}
