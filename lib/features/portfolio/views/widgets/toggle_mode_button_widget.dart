import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/portfolio/view_models/theme_cubit/theme_cubit.dart';

class ToggleModeButtonWidget extends StatefulWidget {
  const ToggleModeButtonWidget({super.key});

  @override
  State<ToggleModeButtonWidget> createState() => _ToggleModeButtonWidgetState();
}

class _ToggleModeButtonWidgetState extends State<ToggleModeButtonWidget> {
  bool isDarkMode = false;
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
    final colorScheme = Theme.of(context).colorScheme;

    final ThemeCubit themeCubit = context.read<ThemeCubit>();
    return InkWell(
      onTap: () {
        themeCubit.toggleTheme();
      },
      child: MouseRegion(
        onEnter: onEnter,
        onExit: onExit,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isHovered ? colorScheme.primary : colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: colorScheme.primary),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Icon(
                Icons.dark_mode,
                color: isHovered ? colorScheme.onPrimary : colorScheme.primary,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
