import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactActionsWidget extends StatelessWidget {
  final double contactAction1Height;
  final double contactAction1Width;
  final double contactAction1FontSize;
  final double contactAction2Height;
  final double contactAction2Width;
  final double contactAction2FontSize;
  final double contactAction2IconSize;

  const ContactActionsWidget({
    super.key,
    required this.contactAction1Height,
    required this.contactAction1Width,
    required this.contactAction1FontSize,
    required this.contactAction2Height,
    required this.contactAction2Width,
    required this.contactAction2FontSize,
    required this.contactAction2IconSize,
  });
  Future<void> _launchCV() async {
    final Uri cvUrl = Uri.parse(
      'https://drive.google.com/uc?export=download&id=1sXHnAcuG8iUzcF0vMmXHxrRjt5y6tHHd',
    );
    await launchUrl(cvUrl, mode: LaunchMode.externalApplication);
    // if (!await launchUrl(cvUrl, mode: LaunchMode.externalApplication)) {
    // if (mounted) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('')),
    //   );
    // }
    // }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: contactAction1Width,
          height: contactAction1Height,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              "Get In Touch",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: contactAction1FontSize,
                fontWeight: FontWeight.w600,
                color: colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () async {
            await _launchCV();
          },
          child: Container(
            width: contactAction2Width,
            height: contactAction2Height,
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.primary),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Download CV",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: contactAction2FontSize,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.download_outlined,
                    color: colorScheme.primary,
                    size: contactAction2IconSize,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
