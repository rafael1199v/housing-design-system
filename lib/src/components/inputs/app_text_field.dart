import 'package:flutter/material.dart';

import '../../tokens/app_spacing.dart';
import 'app_field_label.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.enabled = true,
    this.uppercaseLabel = false,
    this.labelTrailing,
    this.maxLines = 1,
  });

  final TextEditingController? controller;

  final String? label;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool uppercaseLabel;
  final String? errorText;

  final Widget? labelTrailing;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final Widget field = TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      enabled: enabled,
      maxLines: obscureText ? 1 : maxLines,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon, size: 20),
        suffixIcon: suffixIcon,
        errorText: errorText,
      ),
    );

    if (label == null) return field;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppFieldLabel(
          text: label!,
          uppercase: uppercaseLabel,
          trailing: labelTrailing,
        ),
        const SizedBox(height: AppSpacing.sm),
        field,
      ],
    );
  }
}
