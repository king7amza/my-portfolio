import 'package:flutter/material.dart';
import 'package:portfolio/features/portfolio/models/projects_model.dart';
import 'package:portfolio/features/portfolio/views/widgets/project_card_widget.dart';

class ProjectsSectionWidget extends StatelessWidget {
  final GlobalKey<State<StatefulWidget>> projectsKey;
  const ProjectsSectionWidget({super.key, required this.projectsKey});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      key: projectsKey,
      children: [
        Text(
          "Projects",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 500,
          width: size.width,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: projectsList.length,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,
              vertical: 20,
            ),
            itemBuilder: (context, index) {
              final project = projectsList[index];
              return ProjectCardWidget(project: project);
            },
          ),
        ),
      ],
    );
  }
}
