import 'package:flutter/material.dart';

class Shadow2Widget extends StatelessWidget {
  const Shadow2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 1,
      height: 1,
      decoration: BoxDecoration(
        color: colorScheme.shadow,
        borderRadius: BorderRadius.circular(size.width),
        boxShadow: [
          BoxShadow(
            color: colorScheme.tertiary,
            blurRadius: 200,
            spreadRadius: 200,
          ),
        ],
      ),
    );
  }
}
