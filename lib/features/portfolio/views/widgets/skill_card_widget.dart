import 'package:flutter/material.dart';
import 'package:portfolio/features/portfolio/models/skilles_model.dart';

class SkillCardWidget extends StatefulWidget {
  final SkillesModel skill;
  const SkillCardWidget({super.key, required this.skill});

  @override
  State<SkillCardWidget> createState() => _SkillCardWidgetState();
}

class _SkillCardWidgetState extends State<SkillCardWidget> {
  bool _isActive = false;

  void _setActive(bool value) {
    if (mounted) {
      setState(() {
        _isActive = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setActive(true),
      onExit: (_) => _setActive(false),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onLongPressStart: (_) => _setActive(true),
        onLongPressEnd: (_) => _setActive(false),
        onLongPressCancel: () => _setActive(false),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxWidth = constraints.maxWidth;
            final double maxHeight = constraints.maxHeight;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              transform: Matrix4.identity()..scale(_isActive ? 1.04 : 1.0),
              transformAlignment: Alignment.center,
              decoration: BoxDecoration(
                color: colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(_isActive ? 0.15 : 0.08),
                    blurRadius: _isActive ? 18 : 10,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      widget.skill.imagePath1!,
                      height: maxWidth * 0.3,
                      width: maxWidth * 0.3,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: maxHeight * 0.05),
                    Text(
                      widget.skill.title!,
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: maxWidth * 0.12,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    SizedBox(height: maxHeight * 0.02),
                    Text(
                      widget.skill.description!,
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
          },
        ),
      ),
    );
  }
}

/*
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
 */