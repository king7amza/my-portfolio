import 'package:flutter/material.dart';

class ContactTextFieldWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  const ContactTextFieldWidget({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hint: Text(
          hintText,
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(color: colorScheme.secondary),
        ),
      ),
      validator: labelText.contains('*')
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $labelText';
              }
              return null;
            }
          : null,
    );
  }
}
