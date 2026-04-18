import 'package:flutter/material.dart';

class ContactTextFieldWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  const ContactTextFieldWidget({
    super.key,
    required this.hintText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        hint: Text(
          hintText,
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(color: colorScheme.secondary),
        ),
      ),
    );
  }
}
