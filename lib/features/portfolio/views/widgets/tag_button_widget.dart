import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TagButtonWidget extends StatelessWidget {
  final String tagName;
  final GlobalKey selectedKey;
  final void Function() onTap;
  final PointerEnterEventListener? onEnter;
  final PointerExitEventListener? onExit;
  final bool isHovered;
  const TagButtonWidget({
    super.key,
    required this.tagName,
    required this.selectedKey,
    required this.onTap,
    this.onEnter,
    this.onExit,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          colorScheme.surfaceContainerLowest,
        ),
      ),
      child: MouseRegion(
        onEnter: onEnter,
        onExit: onExit,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isHovered
                ? colorScheme.primary
                : colorScheme.surfaceContainerLowest,
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              tagName,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: isHovered
                    ? colorScheme.onPrimary
                    : colorScheme.onSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
