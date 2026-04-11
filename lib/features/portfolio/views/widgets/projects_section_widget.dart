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
          height: 1500,
          width: size.width * 0.82,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            
            // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //   maxCrossAxisExtent: size.width < 600 ? size.width : 300,
            //   crossAxisSpacing: 20,
            //   mainAxisSpacing: 20,
            //   childAspectRatio: 1/1,
            // ),
            itemCount: projectsList.length,
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
