import 'package:flutter/material.dart';

class Shadow1Widget extends StatelessWidget {
  const Shadow1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return ClipRect(
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          width: 1,
          height: 1,
          decoration: BoxDecoration(
            color: colorScheme.shadow,
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow,
                blurRadius: 200,
                spreadRadius: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
