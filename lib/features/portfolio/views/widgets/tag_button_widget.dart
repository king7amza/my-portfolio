import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TagButtonWidget extends StatefulWidget {
  final String tagName;
  final bool isSelected;
  final void Function() onTap;
  // final bool isSelected;
  const TagButtonWidget({
    super.key,
    required this.tagName,
    required this.isSelected,
    required this.onTap,
    // required this.isSelected,
  });

  @override
  State<TagButtonWidget> createState() => _TagButtonWidgetState();
}

class _TagButtonWidgetState extends State<TagButtonWidget> {
  bool isHovered = false;

  void onExit(PointerExitEvent event) {
    setState(() {
      isHovered = false;
    });
  }

  void onEnter(PointerEnterEvent event) {
    setState(() {
      isHovered = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return TextButton(
      onPressed: widget.onTap,
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          colorScheme.surfaceContainerLowest,
        ),
      ),
      child: MouseRegion(
        onEnter: onEnter,
        onExit: onExit,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isHovered || widget.isSelected
                ? colorScheme.primary
                : colorScheme.surfaceContainerLowest,
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              widget.tagName,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: isHovered || widget.isSelected
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
