import 'package:flutter/material.dart';
import 'package:portfolio/features/portfolio/models/projects_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCardWidget extends StatelessWidget {
  final ProjectsModel project;
  const ProjectCardWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () async {
        final Uri projectUrl = Uri.parse(project.projectUrl);
        if (!await launchUrl(projectUrl)) {
          throw Exception('Could not launch $projectUrl');
        }
      },
      child: Container(
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
                    project.imageUrl,
                    height: height * 0.7,
                    width: width * 0.8,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 10),
                  Text(
                    project.title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    project.description,
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
    );
  }
}
